package idw;

/**
 * @author Saqib
 */
public class Mathematics
{
    public static final int RADIUS_OF_THE_EARTH_IN_KM = 6373;
    public static final int RADIUS_OF_THE_EARTH_IN_MILES = 3961;

    /**
     * This method uses the distance formula to calculate the distance between two points on the Cartesian Plane
     * @param p1
     * @param p2
     * @return
     */
    public static double cartesianDistance(Point p1, Point p2)
    {
        double ySquared, xSquared;
        ySquared = Math.pow(p2.getY() - p1.getY(), 2);
        xSquared = Math.pow(p2.getX() - p1.getX(), 2);
        return Math.sqrt(ySquared + xSquared);
    }

    /**
     * This method uses the Haversine Formula to calculate the distance between two points on the Earth
     * @param p1 The first (Latitude, Longitude) ordered pair
     * @param p2 The second (Latitude, Longitude) ordered pair
     * @return The Great Circle distance between two points on the Earth.
     */
    public static double greatCircleDistance(Point p1, Point p2)
    {
        double dLon, dLat, a, c, d;
        double long1, long2, lat1, lat2;

        long1 = Math.toRadians(p1.getY());
        long2 = Math.toRadians(p2.getY());
        dLon = long2 - long1;
        //System.out.println("Longitude difference: " + dLon);

        lat1 = Math.toRadians(p1.getX());
        lat2 = Math.toRadians(p2.getX());
        dLat = lat2 - lat1;
        //System.out.println("Latitude difference: " + dLat);

        a = Math.pow(Math.sin(dLat / 2), 2) + Math.cos(lat1) * Math.cos(lat2) * Math.pow(Math.sin(dLon / 2), 2);
        c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        d = RADIUS_OF_THE_EARTH_IN_KM * c;

        return d;
    }

    public static void main(String[] args)
    {
        System.out.println(greatCircleDistance(new Point(38.898556, -77.037852), new Point(38.879147, -77.043934)));
    }

    public static boolean approxEquals(double value1, double value2, double epsilon)
    {
        if(Math.abs(value1 - value2) <= Math.abs(epsilon))
            return true;
        return false;
    }

}
