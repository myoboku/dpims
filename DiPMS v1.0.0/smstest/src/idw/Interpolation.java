package idw;

import java.util.Arrays;

/**
 * @author Saqib
 */
public class Interpolation
{
    public static final double MIN_DISTANCE = 0.0005;
    public static final int NUMBER_OF_NEAREST_POINTS = 12;

    /**
     *
     * @param points The known set of points that are to be used for interpolation
     * @param weights The values of weights corresponding to the co-ordinates
     * @param unknown The point on which interpolation is to be done
     * @param index The power parameter used in IDW
     * @return Interpolated weight
     */
    public static double computeWeight(Point[] points, double[] weights, Point unknown, double index)
    {
        double numerator, denominator, d;
        numerator = denominator = 0;
        assert points.length == weights.length;
        if(points.length > 12)
        {
            double[][] values = findNearestNPoints(points, weights, unknown, NUMBER_OF_NEAREST_POINTS);
            double[] distances = values[0];
            double[] wts = values[1];
            for(int i = 0; i < 12; i++)
            {
                d = distances[i];
                if(Mathematics.approxEquals(d, 0, 0.001))
                {
                    double power = Math.pow(0.01, index);
                    numerator += wts[i] / power;
                    denominator += 1 / power;
                }
                else
                {
                    double power = Math.pow(d, index);
                    numerator += wts[i] / power;
                    denominator += 1 / power;
                }

            }
            //System.out.println(numerator / denominator);
            return (numerator / denominator);
        }
        else
        {
            for(int i = 0; i < points.length; i++)
            {
                d = Mathematics.greatCircleDistance(points[i], unknown);
                if(Mathematics.approxEquals(d, 0, 0.001))
                {
                    double power = Math.pow(0.01, index);
                    numerator += weights[i] / power;
                    denominator += 1 / power;
                }
                else
                {
                    double power = Math.pow(d, index);
                    numerator += weights[i] / power;
                    denominator += 1 / power;
                }

            }
            //System.out.println(numerator / denominator);
            return (numerator / denominator);
        }
    }

    /**
     * Squared error cost function.
     * @param points The co-ordinates at which the values of weights are known
     * @param weights The values of weights corresponding to the co-ordinates
     * @param index The unknown parameter
     * @return The the cost involved
     */
    public static double J(Point[] points, double[] weights, double index)
    {
        double cost;
        for(Point point : points)
        {

        }
        return 0;
    }

    public static double[][] findNearestNPoints(Point[] points, double[] weights, Point unknown, int numberOfPoints)
    {
        double[] distance = new double[points.length];
        int idx = 0;
        for(Point point : points)
        {
           distance[idx] = Mathematics.greatCircleDistance(point, unknown);
           idx++;
        }

        System.out.println(Arrays.toString(distance));

        // Perform Selection Sort
        for(int i = 0; i < distance.length - 1; i++)
        {
            for(int j = i + 1; j < distance.length; j++)
            {
                if(distance[i] > distance[j])
                {
                    double temp = distance[i];
                    distance[i] = distance[j];
                    distance[j] = temp;

                    double tmp = weights[i];
                    weights[i] = weights[j];
                    weights[j] = tmp;
                }
            }
        }

        double[] sortedDistances = new double[numberOfPoints];
        double[] correspondingWeights = new double[numberOfPoints];

        for(int i = 0; i < numberOfPoints; i++)
        {
            sortedDistances[i] = distance[i];
            correspondingWeights[i] = weights[i];
        }
        return new double[][]{sortedDistances, correspondingWeights};
    }

    public static void main(String[] args)
    {
        Point[] p = new Point[18];
        double[] weights = new double[18];
        for(int i = 0; i < 18; i++)
        {
            double random1 = Math.random() * 200 - 100;
            double random2 = Math.random() * 200 - 100;
            double random3 = Math.random() * 100;
            Point point = new Point(random1, random2);
            p[i] = point;
            weights[i] = random3;
        }
        System.out.println(Arrays.toString(p));
        System.out.println(Arrays.toString(weights));
        System.out.println(p.length);
        double[][] nearest = findNearestNPoints(p, weights, new Point(0,0), NUMBER_OF_NEAREST_POINTS);
        System.out.println(Arrays.toString(nearest[0]));
        System.out.println(Arrays.toString(nearest[1]));

    }

}
