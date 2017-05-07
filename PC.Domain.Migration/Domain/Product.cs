using PC.Domain.Migration.Version;

namespace PC.Domain.Migration.Domain
{
    [VersionMigration(MigrationVersion.V196, 04)]
    public class Product : FluentMigrator.Migration
    {
        public override void Up()
        {
            Create.Table("Product")
                 .WithColumn("Product_Id").AsInt32().NotNullable().PrimaryKey().Identity()
                 .WithColumn("Product_Code").AsString(255).NotNullable()
                 .WithColumn("Product_Label").AsString(255).Nullable()
                 .WithColumn("Product_Category_Id").AsInt32().Nullable();

            Create.ForeignKey("fk_Product_Category_Id").FromTable("Product").ForeignColumn("Product_Category_Id").ToTable("Category").PrimaryColumn("Category_Id");
        }

        public override void Down()
        {
            Delete.Table("Product");
        }
    }
}
