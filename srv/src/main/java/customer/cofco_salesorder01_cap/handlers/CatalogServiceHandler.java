package customer.cofco_salesorder01_cap.handlers;

import java.util.Date;
import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.ql.Insert;
import com.sap.cds.ql.Select;
import com.sap.cds.ql.Update;
import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.messages.Message;
import com.sap.cds.services.messages.Messages;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.catalogservice.CatalogService_;
import cds.gen.catalogservice.RefineDescriptionContext;
import cds.gen.catalogservice.SalesOrders;
import cds.gen.catalogservice.SalesOrders_;
import cds.gen.catalogservice.UnboundCustomCreateSalesOrderContext;
import cds.gen.catalogservice.UnboundCustomHelloContext;
import cds.gen.SalesOrderService.PoSrv_;
import cds.gen.SalesOrderService.Products;
import cds.gen.catalogservice.Books;
import static cds.gen.catalogservice.CatalogService_.SALES_ORDERS;
import static cds.gen.SalesOrderService.PoSrv_.PRODUCTS;

@Component
@ServiceName(CatalogService_.CDS_NAME)
public class CatalogServiceHandler implements EventHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(CatalogServiceHandler.class);

	@Autowired
	Messages messages;

	@Autowired
	PersistenceService db;

	@Autowired
	@Qualifier(PoSrv_.CDS_NAME)
	CqnService poService;

	@After(event = CdsService.EVENT_READ)
	public void discountBooks(Stream<Books> books) {
		books.filter(b -> b.getTitle() != null && b.getStock() != null).filter(b -> b.getStock() > 200)
				.forEach(b -> b.setTitle(b.getTitle() + " (discounted)"));
	}

	@Before(event = CdsService.EVENT_READ)
	public void beforeDisplayInputRead(SalesOrders salesOrders) {
		LOGGER.debug("Enter event displayInputBeforeRead salesOrders: '{}' using compile", salesOrders);
	}

	@On(event = UnboundCustomHelloContext.CDS_NAME)
	public void onUnboundCustomHello(UnboundCustomHelloContext context) {
		onUnboundCustomHello_WithChangeSet(context);
	}

	public void onUnboundCustomHello_WithChangeSet(UnboundCustomHelloContext context) {
		String helloInfo  = "hello " + new Date().toString();

		SalesOrders entity = SalesOrders.create();
		entity.setName("SO00" + new Date().getTime());
		entity.setDescription("by changeSet");
		db.run(Insert.into(SALES_ORDERS).entry(entity));

		context.getCdsRuntime().changeSetContext().run((ctx) -> {
			// executes inside a dedicated ChangeSet Context
			SalesOrders entityNew = SalesOrders.create();
			entityNew.setName("SO00_New" + new Date().getTime());

			// Remote service example
			Result result = poService.run(Select.from(PRODUCTS).where(p-> p.Product().eq("getProduct")));
			Products product = result.single(Products.class);
			entityNew.setDescription("description is product ID: "+ product.getProduct());
			db.run(Insert.into(SALES_ORDERS).entry(entityNew));
		});
		
		String a = null;
		if (a == null) {
			throw new RuntimeException("Dummy Exceptions with ChangeSet");
		}
	}

	public void onUnboundCustomHello_WithoutChangeSet(UnboundCustomHelloContext context) {
		String helloInfo  = "hello " + new Date().toString();

		SalesOrders entity = SalesOrders.create();
		entity.setName("SO00" + new Date().getTime());
		db.run(Insert.into(SALES_ORDERS).entry(entity));

		// executes inside a dedicated ChangeSet Context
		SalesOrders entityNew = SalesOrders.create();
		entityNew.setName("SO00_New" + new Date().getTime());
		db.run(Insert.into(SALES_ORDERS).entry(entityNew));
		throw new RuntimeException("Dummy Exceptions");
	}

	@On(event = UnboundCustomCreateSalesOrderContext.CDS_NAME)
	public void onUnboundCustomCreateSalesOrder(UnboundCustomCreateSalesOrderContext context) {
		LOGGER.debug("Enter onUnboundCustomCreateSalesOrderContext name: {}, desc: {}", context.getName(), context.getDesc());
		SalesOrders entity = SalesOrders.create();
		entity.setName(context.getName());
		entity.setDescription(context.getDesc());
		Result result = db.run(Insert.into(SALES_ORDERS).entry(entity));
		context.setResult(result.single(SalesOrders.class)); 
	}

	@On(event = RefineDescriptionContext.CDS_NAME, entity = SalesOrders_.CDS_NAME)
	public void onRefineDescription(RefineDescriptionContext context) {
		LOGGER.debug("Enter onRefineDescription newDesc: {}", context.getNewDesc());
		LOGGER.debug("RefineDescription context.cqn: {}", context.getCqn());
		SalesOrders dbRecord = db.run(context.getCqn()).single().as(SalesOrders.class);
		dbRecord.setDescription(dbRecord.getDescription() + "+++ " + context.getNewDesc());
		Result result = db.run(Update.entity(SALES_ORDERS).data(dbRecord));
		context.setResult(result.single(SalesOrders.class));
		context.setCompleted();
	}
}