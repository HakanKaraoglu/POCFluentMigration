using PC.Domain.Migration.Version;

namespace PC.Domain.Migration.Domain
{
    [VersionMigration(MigrationVersion.V196, 03)]
    public class Category : FluentMigrator.Migration
    {
        public override void Up()
        {
            Create.Table("Category")
              .WithColumn("Category_Id").AsInt32().NotNullable().PrimaryKey().Identity()
              .WithColumn("Category_Name").AsString(255).NotNullable()
              .WithColumn("Category_Label").AsString(255).Nullable();

           
        }

        public override void Down()
        {
            Delete.Table("Category");
        }
    }
}
