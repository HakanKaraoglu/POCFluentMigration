using PC.Domain.Migration.Version;

namespace PC.Domain.Migration.Domain
{
    [VersionMigration(MigrationVersion.V196, 06)]
    public class Bill : FluentMigrator.Migration
    {
        public override void Up()
        {
            Create.Table("Bill")
                .WithColumn("Bill_Id").AsInt32().NotNullable().PrimaryKey().Identity()
                .WithColumn("Bill_SalesDate").AsDateTime();

            Create.ForeignKey("fk_Bill_Sales_Id")
            .FromTable("ProductLine").ForeignColumn("ProductLine_Id")
            .ToTable("Bill").PrimaryColumn("Bill_Id");
        }

        public override void Down()
        {
            Delete.Table("Bill");
        }
    }
}
