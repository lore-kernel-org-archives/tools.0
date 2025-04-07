Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543A41CAA97
	for <tools@linux.kernel.org>; Mon,  7 Apr 2025 14:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744035297; cv=fail; b=GoT9jMlkCbjJBw2Lw9yxsth9MmwyMKC8hO/yGnil8vkueXzteaVuc94SVGLODsDjh66mjMNyOzUZnmqKkI1Lk8E3waGO0XUDQPg4KVihK9xVpRwL5bMnQewMeZTbksFy5SeQXA8H8NAZNRoAi+ewANMw0VuxH7eEKLhY9GYfrkQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744035297; c=relaxed/simple;
	bh=iGjinOLdAU6sXakFeBaKzquJOVm216FBrvDVairaNAQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=iLS1kS3G+8+VR5w/f1kJ8P/aNBmr/vOvZVOEnQ4uOYNDVpIrJiy80USLX9WOaeRY0llbJIrh+jAD+YN12dE1EUIP5SzOhVNQRxWx+mkojET0ouDrX3CKtx69KLYSG3jnhgZ/yrou1hSZBybEFIBPVUw+hU6Jv3WiZP8PprCqP3k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=oMSueIP1; arc=fail smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="oMSueIP1"
Received: by smtp.kernel.org (Postfix)
	id E451FC4CEE7; Mon,  7 Apr 2025 14:14:56 +0000 (UTC)
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2057.outbound.protection.outlook.com [40.107.96.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6460BC4CEDD
	for <tools@kernel.org>; Mon,  7 Apr 2025 14:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 6460BC4CEDD
Authentication-Results: smtp.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JOIEsupeuyNoUbms9hS5v5+jWF/Nf+nn9E0eQo+mYV7Dci4KCZn8ftdD2J1uUpAoD1dtMPyyPsEacBQvYZY41d0BQPy8qN4kbg2ODnZsSXOER9kAEs9LLhWV+i+u4kCcYAzaOVN7GrrUnjYDcVZDRYGhX6OUXKh+qy5/Rnq7473qrq1XKX7uQBzeWrd7+WLB0GTWxRmsWQ1XHztdWHN0/F329tjbewEqnXQTuMcwtglDzOpYf/hqZ0Bew0r1mv+k6ZF7hncc9E6Tr/27vLkw3XnYR/z1CebUW+qWlLOt3fNMNUzMjA7zwOKAcWK0/1wvMy7rCXpHH8g18+3cFFEV9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZaWjXcx6YfdLCA4KvOfLSU28KC00Eg4A6jnjug4Up2Q=;
 b=Rq1ma9bHENk2BitA4mjLGUjOyC6UCj45ch9rA013Qt88au64J/wlOMtaDz8BKf53Z7fB3lYAwdj5QxSfwAthuVDX/XkAmvwFS/5W3EvSXk54RJY3PWuhksVOK5Xo/5HkQHWhgQznv2MoWICPRY0yv1Euk9wV990C2YZKdZ1TyJ1OIH2L0NmR31XPvUQFqzp0IZRiQUKnFGeXqRGSy7O+IR4ItmeiNg50TB9NevFaHgemh16/CU51cGXgDIr2J1s9B7m3oOVh7X9HS0MroIC6eokh+SY4EnXVhrd9tNtgVeSefUhEsJwfMmABeiMYE5hq6TuuXc/gEPpEuFCjkbY+4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZaWjXcx6YfdLCA4KvOfLSU28KC00Eg4A6jnjug4Up2Q=;
 b=oMSueIP1n0AU0jbhF6vhHXdz5xzAKe/nXOpzlw6p1z9dinI9sibAIsw21qJrXuZGc87NpHe72ELQa+ABJFdmXmtVRRd+pl1V2jwi/EAHF0A/uJoGvAb9bWIxldJIkcC4pFx2J4GNIla8F+e59yUWnSbYxsUZ4arn1t7jhanvHkQ=
Received: from BYAPR02CA0019.namprd02.prod.outlook.com (2603:10b6:a02:ee::32)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.31; Mon, 7 Apr
 2025 14:14:51 +0000
Received: from SJ1PEPF00002314.namprd03.prod.outlook.com
 (2603:10b6:a02:ee:cafe::a) by BYAPR02CA0019.outlook.office365.com
 (2603:10b6:a02:ee::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.34 via Frontend Transport; Mon,
 7 Apr 2025 14:14:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00002314.mail.protection.outlook.com (10.167.242.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 14:14:50 +0000
Received: from yaz-khff2.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 09:14:50 -0500
From: Yazen Ghannam <yazen.ghannam@amd.com>
Date: Mon, 7 Apr 2025 10:14:35 -0400
Subject: [PATCH b4 v2] b4: Include git notes when generating patches
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250407-add-git-notes-v2-1-c0042e938e91@amd.com>
X-B4-Tracking: v=1; b=H4sIAMrd82cC/x2NwQrDIBBEfyXsuRvUGCw99T9KDlvdJB6iRSU0D
 fn3ipeBmWHenJA5ec7w6E5IvPvsY6hG3TqwK4WF0bvqQQk1Ci0MknO4+IIhFs5orLOkLM3aKKi
 bT+LZfxvvBW8NU81Wn0tMR7vYZWsaTQ5CVRlkb4bxrlHiQT8O/VJ/A21P2lxv4wbTdV1/bEUv6
 agAAAA=
X-Change-ID: 20250407-add-git-notes-7cdca2caf472
To: Kernel.org Tools <tools@kernel.org>
CC: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Yazen Ghannam
	<yazen.ghannam@amd.com>
X-Mailer: b4 0.15-dev-79a9e
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002314:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: d95c73a2-c023-4c16-c239-08dd75de8fbe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d3NUVlpySjlMaDVEekVEa0ZLVGc3c0J5SmFQbElSVC9URkM3RG8wbTE3RGQr?=
 =?utf-8?B?eGJIU0J0RmUzejN4OFNDdXlFbnZaTFUrYVJFNzRQRitTb2t6L21YV2piR2NW?=
 =?utf-8?B?Y3ZDRUFRUU84N3o2TWRTUldKSFFaS3JsaUZpemNXVnFKSGhCdUk2eElybDl6?=
 =?utf-8?B?cnEvTmM1dEZselYyckpJdkdKRDd5NkVueDN0RGNpT1E1M004TWRzWlNhVlk2?=
 =?utf-8?B?bzhhQzZScmlMWXJna09iaXFHSTdQSkRpTjBuWFU0UC9BRXBnRFdYODJXRXhn?=
 =?utf-8?B?cFk3T2tZM0NzbS9NM21NeHFKQmoyeEZZSk1FT1NTMHpXdml0R0JnajRiRlRw?=
 =?utf-8?B?MmovMlRFNm9mcE80M2VwS3hSM0FUUWZCbFYrNnhGd3B3eVlyQXZoT09lMGRa?=
 =?utf-8?B?KzVYVWY2VmYzL3hlVGVGVnBwN2I0a0NSQk9ma3JlR2RtaS9Xbmo0dVlJUlpu?=
 =?utf-8?B?K2xVc2lyMWpxZ08wdWdIZWc3NHFBZkh4MWhhR2NYQU9Cd3kyR01McFg2OTFC?=
 =?utf-8?B?dmJ0YnkxcXQ4QjZTNk1qL3RFRlpWa0s3K0k0eitsSUQ3SEUrRDlNcktWTW1L?=
 =?utf-8?B?Vm5xKzAvRTdWQkphNS8xMTNqSTN1cm9jdzQrVTJwUHdRMFBtczlaZkh6RGlx?=
 =?utf-8?B?Y2tJeUc0SFhPbjhBamdrQzVBUzQ0UW9UZnEvb2UxTy9vdkxVNUJNb0N4eUpF?=
 =?utf-8?B?UHJldnM0YUI1NlEyczdhU2RoU3VQeUFqb3JYOTRHajdkRUthR1E0REgwak5Y?=
 =?utf-8?B?Z1RQc0JXeE9YYU4ySm1OY3Q3TzdWc1paZm92bUFUVXYvZ2ZYZ05RQjg2bm5a?=
 =?utf-8?B?cVpJTW52blhESGlYamRvdVloa3RNZ1RQU3dqMHc1TjRGUytFWk9Bby9KM3Qv?=
 =?utf-8?B?TEFwSVRPOEU2ekwrd2JFSGlkTk0rT1VoZ1l0aTVBelZwUGZrdWVoaGdFMmph?=
 =?utf-8?B?Q3ZSeHhaWUR0TUFKeE5vSTN1SGgzSjJyVlZRcm9rdVBVK0pBaVcvRjVLT2Zx?=
 =?utf-8?B?RExVZnhRMFg2NXhiZHV1bnFzbHkwQjRkVlpDOEZoZHhFbFl3S1NrbURTQ25W?=
 =?utf-8?B?MUhOblR0cmxidGNJRWxrMFVHWHNlM2NJWkNKby9RUkNNU1crSjdaSnA3NTU4?=
 =?utf-8?B?Vjg0Ly9RdGZTRHJtMEd1MzFDOUdXUUZ1TWg1alR5dkFNbzRObzhsWmV0Vkxw?=
 =?utf-8?B?RVBvVGdLdWRuc2NrQ0F2MGcybGw4OFlXNGZWVzFuZStlN2RYZEtnSklvQUdO?=
 =?utf-8?B?Ukx1UzJkelZISWFxc1EvTWp5cXE0UVJBWUVPTVcxc1VzeFRqUXJCZlRWbkZn?=
 =?utf-8?B?RkM5NklLdlViWmVKa1NocERnd01HSDhaNzV1clp2bjU3UEJibmRvbi9Rb25o?=
 =?utf-8?B?bGZDQXBJSHI0TFF3aXVrVjNSaHNGTkc0TlN6T2xNTFdzOVYwVXI3TythMDR2?=
 =?utf-8?B?QzIxZFZUZG5jMjh4eW92UXl6eUQ3T1VDZ1U0UklScWJzK2crcnR6U2RLQ1Ba?=
 =?utf-8?B?TldCT1plSUFLZFFjREdwYUgvNVc4SDBRaVpLai9SM1VILzVMYVBwb3J4SXBr?=
 =?utf-8?B?SWFaT0NwWnZQTGhnblE0SWdrZ2RBZ1NoT2xqZEI2WlFtOEx4czlmZ2lFZWZR?=
 =?utf-8?B?SUlEQXFXY1hUUm5iTE5ybGVkMnA1N0psVHQzdXYvUFdaUTNGZVlOQm9EeWkr?=
 =?utf-8?B?QVdvWXhxL2lwVzk1V21ZNExZUFFIbWhHU0pTUkt0KzNrbEJuaVRhQlRPMHI4?=
 =?utf-8?B?VTJOcFZXdVJEMldCQW01c1YvME00dlRONm9QdERPQnh3cjFFOUtUa0VYUnY2?=
 =?utf-8?B?R3dTcHFNRng2MERCODRrR1hmWTdCS3VrZWxRTXhaT2c3SWFyZVVUbmJKY0NH?=
 =?utf-8?B?L0VkRWZKY0tBUDhkVjkyaU5rZTRHcGpHeU5TV0E1bU1XZjZTeU9JTGQwY2tz?=
 =?utf-8?Q?i2ZZ9XB5/xl7zk9oOnWNqfZO7ezEy9Yz?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 14:14:50.9905
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d95c73a2-c023-4c16-c239-08dd75de8fbe
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00002314.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996

By default, 'git show' will include git notes in its output. However,
this is not the case if '--format', or related flags, are given.

Include the '--notes' flag to include git notes in the generated patch.

Also, git-filter-repo does not use git rebase when changing history. So
the default 'notes rewrite' flow will not work. The notes will still be
available, but they will not be associated with the newly created
objects. Fortunately, git-filter-repo records the list of changed objects
after every operation.

Add a callback to copy the notes to the newly created objects. Use the
'--force' flag to avoid benign warnings related to existing notes, etc.
Notes will be copied from an old object to a new object which should not
have any existing notes. Or notes will be copied from an old object to
itself (unchanged), so overwriting its notes is not an issue.

Based on the discussion here:
https://github.com/newren/git-filter-repo/issues/22

This should have no effect on non-users of git notes.

Signed-off-by: Yazen Ghannam <yazen.ghannam@amd.com>
---
Hi Konstantin,

I know you mentioned leaving this topic for now. But after looking
through the issue link, it seemed that the resolution is fairly simple.
And this does not require any special handling/knowledge from 'b4'
users.

Thanks,
Yazen
---
Changes in v2:
- Address git-filter-repo notes handling issue.
- Link to v1: https://patch.msgid.link/20250130201331.73584-1-yazen.ghannam@amd.com
---

Notes:
    Discussion:
    Why use git-filter-repo?
    
    Is it to rewrite history without user input?
    
    Git 2.44 allows 'rebase --autosquash' for non-interactive rebasing.
    https://raw.githubusercontent.com/git/git/master/Documentation/RelNotes/2.44.0.adoc
    
    Maybe this can be used in the future and git-filter-repo can be
    deprecated.

 src/b4/__init__.py |  1 +
 src/b4/ez.py       | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 99ece6484d8e..9e070b088413 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3491,6 +3491,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
             logger.debug('Ignoring commit %s', commit)
             continue
         showargs = [
+            '--notes',
             '--format=email',
             '--binary',
             '--patch-with-stat',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 156926aae33c..1e3f982f0d08 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -659,6 +659,7 @@ def store_cover(content: str, tracking: dict, new: bool = False) -> None:
             frf = fr.RepoFilter(args, commit_callback=fred.callback)
             logger.info('Invoking git-filter-repo to update the cover letter.')
             frf.run()
+            fred.update_notes()
 
     if strategy == 'branch-description':
         mybranch = b4.git_get_current_branch(None)
@@ -775,6 +776,15 @@ class FRCommitMessageEditor:
         if commit.original_id in self.edit_map:
             commit.message = self.edit_map[commit.original_id]
 
+    def update_notes(self):
+        fr_map_file = os.path.join('.git', 'filter-repo', 'commit-map')
+        with open(os.path.join(b4.git_get_toplevel(), fr_map_file), 'br') as f:
+            f.readline() # Skip header
+            args = ['notes', 'copy', '--force', '--stdin']
+            ecode, out = b4.git_run_command(None, args, stdin=f.read(), logstderr=True)
+            if ecode > 0:
+                logger.info('FAIL: update_notes: %s', out)
+
 
 def edit_cover() -> None:
     is_prep_branch(mustbe=True)
@@ -1208,6 +1218,7 @@ def update_trailers(cmdargs: argparse.Namespace) -> None:
     frf = fr.RepoFilter(args, commit_callback=fred.callback)
     logger.info('Invoking git-filter-repo to update trailers.')
     frf.run()
+    fred.update_notes()
     logger.info('Trailers updated.')
 
 

---
base-commit: c25d17121045ab14bec8912d490ba764b515b370
change-id: 20250407-add-git-notes-7cdca2caf472

