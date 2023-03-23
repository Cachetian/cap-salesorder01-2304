package customer.cofco_salesorder01_cap.handlers;

import java.util.stream.Stream;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.sap.cds.services.cds.CdsService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.After;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;

import cds.gen.catalogservice.CatalogService_;
import cds.gen.catalogservice.SalesOrders;
import cds.gen.catalogservice.Books;

@Component
@ServiceName(CatalogService_.CDS_NAME)
public class CatalogServiceHandler implements EventHandler {

	private static final Logger LOGGER = LoggerFactory.getLogger(CatalogServiceHandler.class);

	@After(event = CdsService.EVENT_READ)
	public void discountBooks(Stream<Books> books) {
		books.filter(b -> b.getTitle() != null && b.getStock() != null)
		.filter(b -> b.getStock() > 200)
		.forEach(b -> b.setTitle(b.getTitle() + " (discounted)"));
	}

	@Before(event = CdsService.EVENT_READ)
	public void beforeDisplayInputRead(SalesOrders salesOrders) {
		LOGGER.debug("Enter event displayInputBeforeRead salesOrders.size", salesOrders.size());
	}

}