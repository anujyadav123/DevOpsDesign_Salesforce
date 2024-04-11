public class PieChartController {
list<Student__c> listobj=[select id from Student__c];
    public List<PieWedgeData> getPieData() {
        List<PieWedgeData> data = new List<PieWedgeData>();
        data.add(new PieWedgeData('Jan', listobj.size()));
        data.add(new PieWedgeData('Feb', 15));
        data.add(new PieWedgeData('Mar', 10));
        data.add(new PieWedgeData('Apr', 20));
        data.add(new PieWedgeData('May', 20));
        data.add(new PieWedgeData('Jun', 5));
        data.add(new PieWedgeData('July', listobj.size()));
        data.add(new PieWedgeData('August', 15));
        data.add(new PieWedgeData('Sep', 10));
        data.add(new PieWedgeData('Oct', 20));
        data.add(new PieWedgeData('Nov', 20));
        data.add(new PieWedgeData('Dec', 5));
        return data;
    }

    // Wrapper class
    public class PieWedgeData {

        public String name { get; set; }
        public Integer data { get; set; }

        public PieWedgeData(String name, Integer data) {
            this.name = name;
            this.data = data;
        }
    }
}