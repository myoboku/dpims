package smstest;

public class BugSquasher {

	public static void main(String[] args) {
		
		System.out.println("Trial One:");
		System.out.println(ProcessingUnit.process("Rce", 24.75, 35.55));
		System.out.println("Trial Two:");
		System.out.println(ProcessingUnit.process("Rce d-3:40", 24.75, 33.33));
		System.out.println("Three Three:");
		System.out.println(ProcessingUnit.process("Rce d-2:45, p-3:70", 25.25, 33.33));
		String msg = "Rce d-1:41";
		double lat = 80.0, lon = 9.0;
		System.out.println("Trial Four:");
		System.out.println(ProcessingUnit.process(msg, lat, lon));
		
		/*System.out.println(ProcessingUnit.process("RCE d-3:40", 24.751, 33.254));
		System.out.println(ProcessingUnit.process("RCE d-2:45, p-3:70", 24.741, 33.258));*/

	}

}
