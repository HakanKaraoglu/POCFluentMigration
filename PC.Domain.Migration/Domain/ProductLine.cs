using PC.Domain.Migration.Version;

namespace PC.Domain.Migration.Domain
{
    [VersionMigration(MigrationVersion.V196, 05)]
    public class ProductLine : FluentMigrator.Migration
    {
        public override void Up()
        {
            Create.Table("ProductLine")
                .WithColumn("ProductLine_Id").AsInt32().NotNullable().PrimaryKey().Identity()
                .WithColumn("ProductLine_Quantity").AsString(255).NotNullable();
        }

        public override void Down()
        {
            Delete.Table("ProductLine");
        }
    }
}
