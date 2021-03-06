<?php echo $header; ?>
<ol class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
  <?php } ?>
</ol>
<?php if ($error_warning) { ?>
<div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
  <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<?php if ($success) { ?>
<div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
  <button type="button" class="close" data-dismiss="alert">&times;</button>
</div>
<?php } ?>
<div class="panel panel-default">
  <div class="panel-heading">
    <div class="pull-right">
      <a href="<?php echo $insert; ?>" title="<?php echo $button_add; ?>" data-toggle="tooltip" class="btn btn-success"><i class="fa fa-plus"></i></a>
      <button type="button" title="<?php echo $button_delete; ?>" data-toggle="tooltip" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#form-status').submit() : false;"><i class="fa fa-trash"></i></button>
    </div>
    <h1 class="panel-title"><i class="fa fa-list fa-lg"></i> <?php echo $heading_title; ?></h1>
  </div>
  <div class="panel-body">
    <form method="post" action="<?php echo $delete; ?>" id="form-status">
      <div class="table-responsive">
        <table class="table table-striped table-bordered table-hover">
          <tr>
            <th class="text-center" width="1"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></th>
            <th class="text-left"><?php if ($sort == 'type') { ?>
              <a href="<?php echo $sort_type; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_type; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_type; ?>"><?php echo $column_type; ?></a>
              <?php } ?></th>
            <th class="text-left"><?php if ($sort == 'subject') { ?>
              <a href="<?php echo $sort_subject; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_subject; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_subject; ?>"><?php echo $column_subject; ?></a>
              <?php } ?></th>
            <th class="text-right"><?php if ($sort == 'priority') { ?>
              <a href="<?php echo $sort_priority; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_priority; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_priority; ?>"><?php echo $column_priority; ?></a>
              <?php } ?></th>
            <th class="text-right"><?php if ($sort == 'status') { ?>
              <a href="<?php echo $sort_status; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_status; ?></a>
              <?php } else { ?>
              <a href="<?php echo $sort_status; ?>"><?php echo $column_status; ?></a>
              <?php } ?></th>
            <th class="text-right"><?php echo $column_action; ?></th>
          </tr>
          <?php if ($email_templates) { ?>
          <?php foreach ($email_templates as $email_template) { ?>
          <tr>
            <td class="text-center"><?php if (in_array($email_template['email_template_id'], $selected)) { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $email_template['email_template_id']; ?>" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="selected[]" value="<?php echo $email_template['email_template_id']; ?>" />
              <?php } ?></td>
            <td class="text-left"><?php echo $email_template['type']; ?></td>
            <td class="text-left"><?php echo $email_template['subject']; ?></td>
            <td class="text-right"><?php echo $email_template['priority']; ?></td>
            <td class="text-right"><?php echo $email_template['status']; ?></td>
            <td class="text-right"><a href="<?php echo $email_template['edit']; ?>" title="<?php echo $button_edit; ?>" data-toggle="tooltip" class="btn btn-primary btn-xs"><i class="fa fa-pencil"></i></a></td>
          </tr>
          <?php } ?>
          <?php } else { ?>
          <tr>
            <td class="text-center" colspan="6"><?php echo $text_no_results; ?></td>
          </tr>
          <?php } ?>
        </table>
      </div>
    </form>
    <?php echo $pagination; ?>
  </div>
</div>
<?php echo $footer; ?>