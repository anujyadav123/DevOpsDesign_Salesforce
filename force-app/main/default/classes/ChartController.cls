public with sharing class ChartController {

    public class Month {
        public Integer year {get; set;}
        public Integer month {get; set;}
        public Integer count {get; set;}
        public String yearMonth {get; set; }
        Month(Integer year, Integer month, Integer count) {
            this.year = year;
            this.month = month;
            this.count = count;
            this.yearMonth = year + '/' + month;
        }
    }

    public Month[] getMonths() {
        Month[] months = new Month[] {};
        for (AggregateResult ar : [
                select
                        CALENDAR_YEAR(CreatedDate) y,
                        CALENDAR_MONTH(CreatedDate) m,
                        COUNT(Id) c
                from Contact
                group by CALENDAR_YEAR(CreatedDate), CALENDAR_MONTH(CreatedDate)
                order by CALENDAR_YEAR(CreatedDate), CALENDAR_MONTH(CreatedDate)
                ]) {
            months.add(new Month(
                    (Integer) ar.get('y'),
                    (Integer) ar.get('m'),
                    (Integer) ar.get('c')
                    ));
        }
        return months;
    }
}