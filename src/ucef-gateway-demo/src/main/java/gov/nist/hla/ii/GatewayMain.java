package gov.nist.hla.ii;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class GatewayMain {

	private static final Logger log = LogManager.getLogger(GatewayMain.class);

	public static void main(String[] args) {
		if (args.length != 1) {
			log.error("command line argument for properties file not specified");
			args = new String[1];
			args[0] = "config.properties";
		}

		try {
			InjectionFederate app = new InjectionFederate();
			app.loadConfiguration(args[0]);
			
			// Set the injection and reception here.
			GatewayInjection inj = new GatewayInjection(app);
			app.setInterObjectInjection(inj);
			GatewayReception recp = new GatewayReception();
			app.setInterObjectReception(recp);
			GatewayHook hook = new GatewayHook();
			app.setTimeStepHook(hook);
			app.init();
			app.run();
		} catch (Exception e) {
			log.error(e.getMessage(), e);
		}
	}

}
