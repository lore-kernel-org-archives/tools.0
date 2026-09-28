Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DF3359A91
	for <tools@linux.kernel.org>; Mon, 28 Sep 2026 07:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=100.103.45.18
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790578987; cv=fail; b=YXX/wARB3LmS1zl4fXa/V26qsgMAQCTONC4r1olbpCfiEAh+zJfO145cQh8DQQ/3PiZZcDNqqhshV7BGmOhPEGZqjyg/+4iT08guVk6arK6L1tv9ea4w2M90AXT3GsVXmnEqF6IzYF+EXzodLB5Z2mBwIWmzeRXVg4OUE6ordxQ=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790578987; c=relaxed/simple;
	bh=bJe+DfRM66ljwmdGOx3O17FL/GEu0xGtiY1j5tnDtHU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=aln7+VJhs6OW32HsTN2rfCgh6ZWzkj5EfgXWkcrWdeFyQYHbYM9LFb8iZZhRH1zslfGGr37zRbe7FVu1uPE2iU0QmMGHvZdBwlmCo+SJBt+JyugKLNtrtq5+H4Ij0yoiPWTk4xAFM0N5C7UNvJmbk/vXAG+IBfOWI5/AOzhStM8=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b5mMnmku; arc=fail smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b5mMnmku"
Received: by smtp.kernel.org (Postfix)
	id CBB0F1F00893; Mon, 28 Sep 2026 07:03:05 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.0
ARC-Seal: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=pass;
	t=1790578985;
	b=JzU9J6nbl5jfphb6LC+Q9H8TvYLYYBfMes+D/Jr2sL3ibxxBkZhel61bNX8UpXzJ9QMJ
	 gTrx+rsdcru5/NqfUhw/hjlJHZlUiyZg7dvof9f2R+L33wiJ6qrUkxKwGOLohqwCeyyRO
	 l9UNaYBAA/cLqpmxTXvflQRouVz1u/TSBC9ON+oaNY3uMgVcNTlnFZtvX7Q0fNH/2ZdU2
	 p1Yq4kCbWdr0TXQbSbyqARyGa4eG80lZ2Nc3Y2iM+z4WYbMBk/+Bfy6lkmNgUkZMuMj9X
	 reht+CliC5ZuGHjlqih2gAAE/FIz1o+XT4SIjCHOd+fAIXYUE8R6MJx8La4zW+Ob6yA==
ARC-Message-Signature: i=2; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1790578985;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:Content-Transfer-Encoding:Content-Type:
	 X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=jJ0nnBMDqxaImzzun7wznaEi7X8vE6QDkriSj5xoqus=;
	b=vgya+sYBid0k2G2x45/LTg9pe80ukLN69iEL4v6bk4yei23c47xSmOIL55Cb9HKkas/a
	 kPbc2xcy1uPUC64k2GPsYxSl8QFmAfevFvOK+g2ZTS8pDSptd9KDIt9o1Yg3lVav32gkC
	 nlcG9wu0aRqzE2D6B/RWZ89TbcubHah52XbyQvrOmvHpz2dKctqtc/4SM2mWNhXfJE5lY
	 PRiApX+ZuUaGxLuct5ZuGnwIy4BnR7MG8VBHt6VvtKXCF116fobX1bThjqZnrb3gT5Wd9
	 1MOdUYSoYaWUzcpDXii2zZtzWzK5A77mwM/t8ql2fqJ2CK+A5BSWe3gjiutPJBr4TiA==
ARC-Authentication-Results: i=2; smtp.kernel.org; dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b5mMnmku;
	dmarc=fail header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.196.0
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013000.outbound.protection.outlook.com [40.93.196.0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D1D4C1F000FF
	for <tools@kernel.org>; Mon, 28 Sep 2026 07:03:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=b5mMnmku
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org D1D4C1F000FF
Authentication-Results: smtp.kernel.org; dmarc=fail (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pVZQzRZEaldH0B+XVBP6Bcs2hqRUDV88QhJz4AW/9VNVTTK8cmpiBbzHIfpUATRbY3ebnvBXxNmgBNnj9dAdYBu2b0Z5oxuXk6Oj1KEU1KMLGNOEcicrVxFXcWheQJVE1+HdVd4nD5gbwjdLpQrL7w/OP6cqpmmH19OFjzrQF4xxv6kTF3Ov0jbAake8f7TUTVCk4kd3RTIkoUw8v4nv8ozXkOzK74GhC2HQZOyUNfOkfnqiCQ2wcHF0uPf7l3eWZMSnwXyKoMS0sVBS5jc+89Twb4c4Avg5s3mKNBtOexd7MbEwnW1CoBN6JKk628Jy8Qn9GJqfCnmcpt+cJ5nTGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jJ0nnBMDqxaImzzun7wznaEi7X8vE6QDkriSj5xoqus=;
 b=F05lmGwSxGDTIoCakm8T8hIdnVyaTAfuWThB43xnlpefn1i2y0S3CQo/EYgUj0NfN1SDZPhDZMiIbdI4EnnCh3IlhEle0+APJVN14kYZrgVSSlR1SQfw3uasrbePL7UIypgSLmWaZbJxSoW28j+WxBHX8GQYvs7soP4HB1snaBW6vnmDoNvsWk/gYNkF4uXAR+1rxKgwe/B0N4JoIhElcQwVvhpkJp5qkpn3Go9SF0V55PwHGggirsGi3LPWPk+cW+Qex+CquejwcmQRG4zvxFsvkDzSyIsx7iFFx9mVQhsWSaNqswXOzY6Wgcx6Zj2As3AptlYBap7XPU7aU/DiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jJ0nnBMDqxaImzzun7wznaEi7X8vE6QDkriSj5xoqus=;
 b=b5mMnmku+xGhWldBQplcOoA0wbAL9KqHdaK9Uw2vKOkzb0OLeD5VVza0J5fXyXESxMJF1eTSLYB8adO7AAKznoPdeO98RLsJVNoEQymmybmg5WXTtZxd0Vu8WpmPLtUFXJyne6WQSppwhWiUkayjAfwY/KDUsrojlBQxrOKk9Ktu/4b1S0sOVvfxkYvSAd+5mhnP5vWMxHkWclc0XnZ2ZwoENiyPAdjyS4d382f3ZhdG1SaH0LdIwVfsw8f6I/HqIuqjUwmawHig4sDXbtPAM47U1QbOc2KyuKstaV4YdDxaA1LSRo3QAHBNM31oWNEiMtYZJlpBuZW8HXqgfaKnjQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB4827.namprd12.prod.outlook.com (2603:10b6:5:1d6::14)
 by DM4PR12MB7719.namprd12.prod.outlook.com (2603:10b6:8:101::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 07:03:01 +0000
Received: from DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c]) by DM6PR12MB4827.namprd12.prod.outlook.com
 ([fe80::6261:3040:864b:159c%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:03:00 +0000
From: Andrea Righi <arighi@nvidia.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: tools@kernel.org
Subject: [PATCH] mbox: add option to save all series revisions
Date: Mon, 28 Sep 2026 09:02:52 +0200
Message-ID: <20260928070252.3678339-1-arighi@nvidia.com>
X-Mailer: git-send-email 2.55.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0121.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:20::18) To DM6PR12MB4827.namprd12.prod.outlook.com
 (2603:10b6:5:1d6::14)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB4827:EE_|DM4PR12MB7719:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e114a75-3c3f-4935-59cb-08df1d2e8816
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	7kEy5/gk1ZyvwZFt5u8BrncRLOos7eDEfyheP7nUWRkVjGM5RALR45U8+CSHXSH9Cp/mnqsm0ZlOnh4FG4zukEBW0QyiyCSPjEjaMx3NhYgNvxD+ffoCPUBK1/YLq7YeMhQyX3mhWUZWzvBxduWXGpyWzbRQz4WZT1V8FtGogAUclylxk1MmxrCmkVmZVScfSQDW+WU75DCjvTpX402MS+c3nY/2GQa8GzkXSmxWJJ9mzzCXfH1M4+WXngBIUCoecn28M3i3WjSY1muHHRrGI7CPzfmRX2VJu9ms8tgWAIBwj3vDg/f+Pw09BMpbccb9IOLVOYeVNU3LjNVxNsKdxCT4LzWIyor3HgpBioPbggx8bLxmkEZougt1EORnv2WzsQ/gSyyyF/kZirwmLROB8AcARvSRCcWqknDulT8ulTg8K7wOA2mPLVbDKKT5MZ7qvYXGzGXhI4z795WuItnnqb9JZN4w+S5PAJA+qM9s9l7p02UHQ0asaFITgFNCASe6zlk/PS6XKi+6LYCbHfLoTICEq4j9POWMQJe/f7jk13K+Uwjl7DFy6+mH0eLmq6vnRu/cOT8jjHGi5lbugmxaefKU0KudvK8dqcfC1RE8xQinTIbRTKS/TQJdfDHOV2j2ndrSElCqNZDMZntMLgq3UDbAixJBWQ1wNH0BdbyS9i0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4827.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HPd3o0IxqUl06EP13j7xIXzbiSY8wcMuHb7/BmRKLVm4LDHvrLuG87gsVxw5?=
 =?us-ascii?Q?F0v/a/9lcm35caDrReBHzI6104Juf5mp/zghxA06J51gT2HWONNgqq+31e3L?=
 =?us-ascii?Q?KDPaiD0LOkmsQqRliVrlu3TTbU9xXxrRmTU3xqzX8Q5qqg5C9YFvJQLxEOXV?=
 =?us-ascii?Q?4/KWcLA6D4QI0Hz12harIGmZlOUXoKAUCh1EKYqtaAFsfaa+kjkbzfSUMB8I?=
 =?us-ascii?Q?4Y86gBjo94TS3TgzmVkhA4jdqbnbHKUxOL2n0I1YuaFTiQJbcL5QVbwyXzEt?=
 =?us-ascii?Q?vqnQjOEAjREmqgZS0DPPjeUQYZWHMVOrhzLnrXIqtku+wPRu+As7nQf3/afU?=
 =?us-ascii?Q?RzFIPqWYp9y1C9W3138SVpu/RDjZQv6u+VYGoEH1ZErCrO5ODIfkpOczH6TS?=
 =?us-ascii?Q?NgoutcMjW6beQFdAV6qWn/7/enj64SCjgxQf8/h2uET2PZMbzOhkNMbiK4AG?=
 =?us-ascii?Q?KatUOO58WSeQXeCUlWS9eUzsZFnNRZ6XXwMGzjZDyYNG4BjBTZ3oDh+3mXRu?=
 =?us-ascii?Q?k667xAAlLJ6YBY9N4LDYIwUOYi052TeGb3Pmy9L2Oqrh9dCMVQhOlgofQlZI?=
 =?us-ascii?Q?Ur8YbOr2xmDSieaQVf1aIW92i6MhUdj5PZJKXHrOx4GXyfW34z3D2LlLCGGQ?=
 =?us-ascii?Q?bYVxHLRqNM9prerN9H9tRwQSt1E2J2mNn1TkeQDDmep6hnfa/vCzlI+7D8r0?=
 =?us-ascii?Q?masvhFMZHv7NpgOwNkrjMn3xWmK1G4zIjhIitB5LkaRQr3+K9j9aOZBk7V0h?=
 =?us-ascii?Q?d0AcDQjHTdVTfQuwrAX/t2wFfB80tusnf5HnvIdPOMIYH/tvjpMUql8ueKah?=
 =?us-ascii?Q?/Vui/Eyqbr6xmJAlxDU1+56Rj9oI6At2wH4aUTx/CcNmrugDgkxmawc9wRkW?=
 =?us-ascii?Q?Ty3/Xv6nR/4QNIUBXKc/mHqFeMnv6LDJ0XJwCuRCFn0t0hwxSl+WwrMPzDAr?=
 =?us-ascii?Q?qFQ52g7be9Zxtkx9hXDI5gyn/qhxwNrHEnWY22gbvPM4oCxdqLlfsZ6o3LPM?=
 =?us-ascii?Q?vEUxkPAI/bSshb4w+JpJrmsw753IkCrjVKuD5Ihq9Y0/avvUNi6fHTLaYJ0j?=
 =?us-ascii?Q?B5AzKmIOJaKWpFqRGpUuEvishL+F3z3yfe3oMkyHb5P9xyia4VaIGmXNu/Y4?=
 =?us-ascii?Q?MJDj499l3GgDqBAtBtkZ07W8+X8QouYyY3c7roSFKL3Fm/cQh9ULfWTJIugG?=
 =?us-ascii?Q?DryIbVkxhml9SrpFZcua6bxzIVEMmNv6bpvffPJ2Mf4plQ+da7EXUfXy0UW4?=
 =?us-ascii?Q?4CD0D8WTkaAaRV1vMPabiiw48oVisIRaigXLWz2Egrit4gPn0YUgqBOF/Pd6?=
 =?us-ascii?Q?OkA2ZdEzD4hPCt7T5YP//YaKtsvwZ/K8QujyHRO+hS+4OUspXNWsLsWp8Vhx?=
 =?us-ascii?Q?CskrvMmrWTzNIYy4YIMyDmcbIlUMYnlxNCqRCg7hhykKmBmXFcbbGuvvBxQd?=
 =?us-ascii?Q?4Wl0XYj6BUa1rjiiHtTSPafQZLmmWyUZfIdkc/lEaYE73r3kha5N7bew5hBd?=
 =?us-ascii?Q?TTznJLQxr9lTfibXvZ8O5pv+iFHIe5Y7UhNiJkV1mZPb7MimgZrqjkDs+jRS?=
 =?us-ascii?Q?HlqacHrN7X2IofuTKYP3CecjpIn97j10EsGbVnJkDSli9Um8vETDiGBJKTyg?=
 =?us-ascii?Q?5rDPEIukqXQ+YYvSJ54DgZrDz3krGntopLkrvOHp78ZKVekvZqOlMfOrWXdz?=
 =?us-ascii?Q?7CAE8fhE+BI5HBwqZOIg3ThTa4K9alRJ2qLDQfXJFGEZScGnuIastYtCBVzG?=
 =?us-ascii?Q?rINCQuCMdg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e114a75-3c3f-4935-59cb-08df1d2e8816
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4827.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2026 07:02:59.9980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ntolNRFKw2t3xqoyVhtCOa1TIhPe3ZQNua8fQL0kqWuABY8FucZAZGaJNv3Sm/9gQXx67DsFIBHE8BZ0XzqSKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7719

There is currently no way to save a patch series together with all its
previous revisions in one mbox. Sometimes, having the full history in a
single mailbox can be helpful to see how the series evolved.

Add -a/--all-revisions to b4 mbox to find older and newer revisions and
save their discussion threads in revision order. Reuse the revision
search from review tracking and document the 12-month limit on backward
discovery.

Assisted-by: LLM [analysis, codegen, tests]
Signed-off-by: Andrea Righi <arighi@nvidia.com>
---
 docs/maintainer/mbox.rst | 12 +++++++
 src/b4/command.py        |  6 ++++
 src/b4/man/b4.1          |  4 +++
 src/b4/man/b4.1.rst      |  4 +++
 src/b4/mbox.py           | 35 +++++++++++++++++--
 src/tests/test_mbox.py   | 73 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/docs/maintainer/mbox.rst b/docs/maintainer/mbox.rst
index c2c5e4b..9289810 100644
--- a/docs/maintainer/mbox.rst
+++ b/docs/maintainer/mbox.rst
@@ -101,6 +101,18 @@ Option flags
   later revision is also available and will add these results to the
   retrieved thread.
 
+``-a, --all-revisions``
+  Check for both older and newer revisions of the selected patch series
+  and save the messages grouped by revision, oldest first. Messages
+  within each revision are ordered by date. For example::
+
+      b4 mbox -a -n review.mbox <msgid>
+
+  Revision discovery depends on the available public-inbox archive and
+  may not find revisions whose subject and author changed without a
+  matching ``change-id``. The older-revision search looks back up to
+  12 months from the newest revision.
+
 ``-n WANTNAME, --mbox-name WANTNAME``
   By default, the resulting mailbox file will use the message-id as the
   basis for its filename. This option lets you override this behaviour.
diff --git a/src/b4/command.py b/src/b4/command.py
index c65a5e4..0ef4c6c 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -355,6 +355,12 @@ def setup_parser() -> argparse.ArgumentParser:
     # b4 mbox
     sp_mbox = subparsers.add_parser('mbox', help='Download a thread as an mbox file')
     cmd_mbox_common_opts(sp_mbox)
+    sp_mbox.add_argument(
+        '-a',
+        '--all-revisions',
+        action='store_true',
+        help='Find older and newer revisions and save them in revision order',
+    )
     sp_mbox.add_argument(
         '-f',
         '--filter-dupes',
diff --git a/src/b4/man/b4.1 b/src/b4/man/b4.1
index b93e42c..22ad531 100644
--- a/src/b4/man/b4.1
+++ b/src/b4/man/b4.1
@@ -113,6 +113,10 @@ folder.
 Stitch multiple unthreaded messages into a single series and save as
 an mbox file. Useful when a submitter sends patches without proper
 threading.
+.TP
+.B \fBb4 mbox \-a \-n review.mbox [msgid]\fP
+Find older and newer revisions and save their discussion threads in
+revision order to review.mbox.
 .UNINDENT
 .SS b4 am
 .sp
diff --git a/src/b4/man/b4.1.rst b/src/b4/man/b4.1.rst
index 429d3ad..ded7d6e 100644
--- a/src/b4/man/b4.1.rst
+++ b/src/b4/man/b4.1.rst
@@ -83,6 +83,10 @@ For options and their descriptions, see ``b4 mbox --help``.
   an mbox file. Useful when a submitter sends patches without proper
   threading.
 
+``b4 mbox -a -n review.mbox [msgid]``
+  Find older and newer revisions and save their discussion threads in
+  revision order to review.mbox.
+
 
 b4 am
 ~~~~~
diff --git a/src/b4/mbox.py b/src/b4/mbox.py
index e3c1df2..05da1ed 100644
--- a/src/b4/mbox.py
+++ b/src/b4/mbox.py
@@ -1053,6 +1053,16 @@ def _run_shazam_merge(
     sys.exit(0)
 
 
+def revision_sort_key(msg: EmailMessage) -> Tuple[int, int, int]:
+    lsub = b4.LoreSubject(msg.get('Subject', ''))
+    parsed_date = email.utils.parsedate_tz(msg.get('Date', ''))
+    if parsed_date is None:
+        timestamp = 0
+    else:
+        timestamp = email.utils.mktime_tz(parsed_date)
+    return lsub.revision, timestamp, lsub.counter
+
+
 def main(cmdargs: argparse.Namespace) -> None:
     # We force some settings
     if cmdargs.subcmd == 'shazam':
@@ -1070,7 +1080,8 @@ def main(cmdargs: argparse.Namespace) -> None:
     else:
         cmdargs.mergebase = False
 
-    if cmdargs.checknewer:
+    all_revisions = cmdargs.subcmd == 'mbox' and cmdargs.all_revisions
+    if cmdargs.checknewer or all_revisions:
         # Force nocache mode
         cmdargs.nocache = True
 
@@ -1086,9 +1097,29 @@ def main(cmdargs: argparse.Namespace) -> None:
     if not msgs or not msgid:
         sys.exit(1)
 
-    if len(msgs) and cmdargs.checknewer and b4.can_network:
+    if (cmdargs.checknewer or all_revisions) and b4.can_network:
         msgs = get_extra_series(msgs, direction=1, nocache=cmdargs.nocache)
 
+    if all_revisions:
+        if b4.can_network:
+            subjects = (b4.LoreSubject(msg.get('Subject', '')) for msg in msgs)
+            latest = max(
+                (
+                    sub.revision
+                    for sub in subjects
+                    if not sub.reply and sub.counter <= 1
+                ),
+                default=1,
+            )
+            if latest > 1:
+                msgs = get_extra_series(
+                    msgs,
+                    direction=-1,
+                    wantvers=list(range(1, latest)),
+                    nocache=cmdargs.nocache,
+                )
+        msgs.sort(key=revision_sort_key)
+
     if cmdargs.subcmd in ('am', 'shazam'):
         make_am(msgs, cmdargs, msgid)
         return
diff --git a/src/tests/test_mbox.py b/src/tests/test_mbox.py
index e1df42b..8401e22 100644
--- a/src/tests/test_mbox.py
+++ b/src/tests/test_mbox.py
@@ -1,7 +1,9 @@
 import io
+import mailbox
 import os
 import sys
 from email.message import EmailMessage
+from pathlib import Path
 from typing import Any, Dict, List
 from unittest.mock import patch as mock_patch
 
@@ -127,6 +129,77 @@ def _make_msg(
     return msg
 
 
+def test_mbox_all_revisions_from_middle_version(
+    tmp_path: Path, monkeypatch: pytest.MonkeyPatch
+) -> None:
+    monkeypatch.setattr(b4, 'can_network', True)
+    author = 'Author <author@example.com>'
+    v1 = _make_msg(
+        '[PATCH] foo: fix bar',
+        author,
+        'Mon, 21 Sep 2026 10:00:00 +0000',
+        msgid='<v1@example.com>',
+    )
+    v1_reply = _make_msg(
+        'Re: [PATCH] foo: fix bar',
+        author,
+        'Mon, 21 Sep 2026 11:00:00 +0000',
+        msgid='<v1-reply@example.com>',
+    )
+    v2 = _make_msg(
+        '[PATCH v2] foo: fix bar',
+        author,
+        'Tue, 22 Sep 2026 10:00:00 +0000',
+        msgid='<v2@example.com>',
+    )
+    v3 = _make_msg(
+        '[PATCH v3] foo: fix bar',
+        author,
+        'Wed, 23 Sep 2026 10:00:00 +0000',
+        msgid='<v3@example.com>',
+    )
+    v3_reply = _make_msg(
+        'Re: [PATCH v3] foo: fix bar',
+        author,
+        'Wed, 23 Sep 2026 11:00:00 +0000',
+        msgid='<v3-reply@example.com>',
+    )
+
+    parser = b4.command.setup_parser()
+    cmdargs = parser.parse_args(
+        [
+            '--no-stdin',
+            'mbox',
+            '-a',
+            '-o',
+            str(tmp_path),
+            '-n',
+            'all.mbox',
+            'v2@example.com',
+        ]
+    )
+    with (
+        mock_patch('b4.retrieve_messages', return_value=('v2@example.com', [v2])),
+        mock_patch(
+            'b4.get_pi_search_results',
+            side_effect=[
+                [v3_reply, v3],
+                [v1_reply, v1],
+            ],
+        ),
+    ):
+        b4.mbox.main(cmdargs)
+
+    output = mailbox.mbox(tmp_path / 'all.mbox')
+    assert [msg['Message-Id'] for msg in output] == [
+        '<v1@example.com>',
+        '<v1-reply@example.com>',
+        '<v2@example.com>',
+        '<v3@example.com>',
+        '<v3-reply@example.com>',
+    ]
+
+
 def test_get_extra_series_rejects_prerequisite_change_id() -> None:
     """Series listing a change-id as prerequisite must not be
     treated as newer revisions of that series."""
-- 
2.55.0

