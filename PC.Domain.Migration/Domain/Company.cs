using FluentMigrator;
using PC.Domain.Migration.Version;

namespace PC.Domain.Migration.Domain
{
    [VersionMigration(MigrationVersion.V196, 02)]
    public class Company : FluentMigrator.Migration
    {
        public override void Up()
        {
            Create.Table("Company")
                .WithColumn("Company_Id").AsInt32().NotNullable().PrimaryKey().Identity()
                .WithColumn("Company_Name").AsString(255).NotNullable()
                .WithColumn("Company_Group_Id").AsInt32().Nullable();

            Create.ForeignKey().FromTable("Company").ForeignColumn("Company_Group_Id").ToTable("Group").PrimaryColumn("Group_Id");

        }

        public override void Down()
        {
            Delete.Table("Company");
        }
    }
}
