Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F2F0353347
	for <tools@linux.kernel.org>; Wed, 20 Aug 2025 14:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755701716; cv=none; b=RMSY7qdlMmuixkEcEIZaTR9LvJflMYPWbnFuV7Yb76oxV4EkpRSgTIbZODk4WpwekyDHfB4Ig/72SbyI4IDgRzjqo7KUFOHfJSwEkdfT7F/VxAz2EgmizlU0NIVGhfLejoOUNOEbVK1kLtkzuJ5T3+9W+Up/ZTnmHq/u+eAQDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755701716; c=relaxed/simple;
	bh=o9KVhKQ0ymC/y7Di0SuA+kdffB/2tc/6OdbkmzKFc/M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OtbBP2DDm9y2wduynEWKIfjDe55MHWl71unK8Ts1ETGozBavEx2M4RNaxd8gZ8jLniFt1M3sbQ9GG1qRQy89vBcjmFS33QOrqJ7YOM5p4HNyM0ppiyPYthoXVcK8PazfCZaTGUFGWJQI7vSt7bw5sY4yrg8ZxGAE9RxX7B3v21w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bD0ropPF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bD0ropPF"
Received: by smtp.kernel.org (Postfix)
	id 03451C116B1; Wed, 20 Aug 2025 14:55:16 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E326FC4CEE7
	for <tools@kernel.org>; Wed, 20 Aug 2025 14:55:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org E326FC4CEE7
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-afcb7aea37cso835341166b.3
        for <tools@kernel.org>; Wed, 20 Aug 2025 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755701713; x=1756306513; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g5oAmcx6+UWb+ZjzLVchS2gGKmUJg1shOyranncfrVM=;
        b=bD0ropPFBG177bCZO7kEOW2sFYZEOUe8pDGJopV7Msn9JyPZxNVeHxiS86NwB5aA+d
         qMPL1FwFf0QOX3sLmR/9XFqre49F1zcv57ymOZb2+QiC+/oOZliMdpivhM2LU/6VSJKw
         xgTGyBw/ipcBG830/KmtbzcEwWN2nqTsFaUlvJbAUd6tVLehIqdK56bPxPCTw6nVmps2
         RzZNpTE1WCvO/l7+tJS7mFxXRLSdGHyxHXCUZ7x9S7F1OQktCi//usPBeVejJaGiXb1r
         IX8snQWzV/RNgUzfxTinJlq+mHqXr5M5fD+8PJDr6gRLkK/Ed7B6rSxch8x+GNYK2DMq
         Hj7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755701713; x=1756306513;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5oAmcx6+UWb+ZjzLVchS2gGKmUJg1shOyranncfrVM=;
        b=eq18Sv0JF2TzLSc3SpBo1LZ9OgvaniwxurluU1ZqyuUXmQL2dZSD6VvXmOh77yQMtZ
         fapsbdmO77l4Z46xWrG/MxnU62r9XtLuemGXyfqZZKnE+s8EpLRlLlE5VN7W7fLsr3Og
         z12ZgicpSz9QPLQ6gXklL47sWGEdkGx5euEBZXL5u650s98by/qACf+4mrRcPLvQMon/
         +sT1q+84qoc2OLa9PfHo2X+xlWPVdcvmqYMrq0eZvqrcIdVV0z0nD/vhnIyAHvglONsm
         xtqtHw0uLEyp5p/C/NbABIttndJyfRf5/7UW1gCnIEIMOcPhRb2uz1wYWWfrM+CnLxdq
         oS0g==
X-Gm-Message-State: AOJu0YzQfKNVpC4wDgWvi6TbAbExEEbK1yhKiuDx21QDjwEv7WOV4pKR
	g4AMfFw+kFTiPOSLX51tH8xsVIoujZSjZgmXTY1wMTdL5SEa2/UnGBSnOV0FFJk5WQY=
X-Gm-Gg: ASbGncuPfLjVzV3ou1At5SZ4VYyifmRyDK4KHJHh/pEnxg9qY18bNtfY6OEelUK+NRX
	Xh691zLc+1kFOYrYd1vAu8m/hH9Z6wCJO2t1fAwuP6Kzc+JhrZF4JeOHV13EakqYwpvOfTa6dPJ
	u4qP8UMVb82KLXlHnyVae1owGFSApPnUAJFoQkXl3M4Bt/nx1oA4z4m6e6RFQxTCRADNYbuHPuW
	EKWI/vpF9rcNDxRNjgaQj/C7QEKe9aFDrb8b85cUT4tb/iBUw9OHkNRDRtpkcHOVVT4dxrFkmue
	LASjJ3z4tkXopXJdmYifGpOJ2gmAKJ3o+39esyHGCeOP3gNAxMV02+ttxt1pZ96pYbvZaq7K26k
	4pR00ZnBWfnjaUkyiRoM+6IhH/S3/cnsziOOUZ1CXLMh2RVwGI1qHq+cPhbMIWtqGuDBh
X-Google-Smtp-Source: AGHT+IGWpQVQylmszFh983zBYx5muI59GmrhsSXAaFeQ+PxPgmYeL5f8khLeyqpO+zBOVkc4UjtqWA==
X-Received: by 2002:a17:906:f5a4:b0:ade:3bec:ea30 with SMTP id a640c23a62f3a-afdf00f76demr264811366b.1.1755701713094;
        Wed, 20 Aug 2025 07:55:13 -0700 (PDT)
Received: from [127.0.1.1] (athedsl-4441256.home.otenet.gr. [79.129.180.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afded3070dbsm187606866b.46.2025.08.20.07.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 07:55:12 -0700 (PDT)
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 20 Aug 2025 17:55:04 +0300
Subject: [PATCH b4 2/3] prep: add --auto-list-unreviewed option
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-auto-unreviewed-v1-2-b0af9cac4b4d@linaro.org>
References: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
In-Reply-To: <20250820-auto-unreviewed-v1-0-b0af9cac4b4d@linaro.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
X-Mailer: b4 0.15-dev-b423f
X-Developer-Signature: v=1; a=openpgp-sha256; l=6065;
 i=manos.pitsidianakis@linaro.org; h=from:subject:message-id;
 bh=o9KVhKQ0ymC/y7Di0SuA+kdffB/2tc/6OdbkmzKFc/M=;
 b=LS0tLS1CRUdJTiBQR1AgTUVTU0FHRS0tLS0tCgpvd0VCYlFLUy9aQU5Bd0FLQVhjcHgzQi9mZ
 25RQWNzbVlnQm9wZUhOK09CZlVIYVBKcjZic0sxeExZSjhPaXFBCkNKaGJpbVdlVmE3YmsrR09Q
 QTZKQWpNRUFBRUtBQjBXSVFUTVhCdE9SS0JXODRkd0hSQjNLY2R3ZjM0SjBBVUMKYUtYaHpRQUt
 DUkIzS2Nkd2YzNEowRzJrRC80cWExTm5kSWNXS2xLMVl0K0dhbEhMRGFBR1JWQXZKM3FuTGE1eQ
 pXdjUzaXY2VHg5RGNNUE5EdjB0SWpDNEl0Z2lPQkJNalB4cUZwemQyY29TTCs0TENzVlBCVFBCe
 W9RcnBodlZ6CmNrR3JZWGZoMkJZdEZJUXhtYWVNWlMzdFRuRXB5bjVXOEwzVDRmejY1NUFGUVFK
 YzJPOWVaOEZ3dWZXOWJrV1kKa0dqaERMYjliY3U0U1gvdmltaDM5T0NTSVVSL3lqd3VIbERwVHR
 sbGJWaXYyUzRPaTdnZnBidFpndkx3aHlycgp2SFpvZFJyS1hnbytHZHZSTFJNdU1LSVBJMTVUQ3
 hNVXRmeUZKTi9uL1JvMFdJOXB0Vmtia0NiTmVlN1ZsbDNvClRVNmFHN0ROVWoxdUZLZ3ZGTzRvR
 StkRUY5OWQ1MU5hUy90ckRaOHhCWTNuU0lyakFtalZKeFpETWtiRFczQWIKbjM3QTNRTEJzQlRR
 MkQ3aVA2NW1ETzBpTzNvTlFuNmFHTWtPSWdUT2tQY000QXpkVlk1dVFnVHZDZi83V0VUVgpiYVh
 yc25kbFVBSTVaYXdyRVdaNFl4WFVHR1luamxXRFhzc01KVjhJNldtK1M0am9mcjQ3ZndSWHZDcF
 N4d1FwCkRLNG5CTzR2WUJRb3E3bE5XWC9XVFlmSHQvRW9QcGQ5dHl4Z3dJcVVMUzgwak5ZckY4S
 UFlcnptNzFTUTc0aFUKYk9qcUxZYno2K2V3MlBMZ2d0dkNUckd5NEFyZTN6K0JIak1ZZTdXTVBY
 WjZhRlhjeVRBUjRZZzFIVENLdmY2ZQpqb0hHOGl0TUJSaStjazFXRWpVb3BTLzBXc1pjZDJ0OEh
 HenNZY3czeFB1eGRxR01rRGxkQXA4OHkrQVZndjhVCndFa1c1UT09Cj1XRkZICi0tLS0tRU5EIF
 BHUCBNRVNTQUdFLS0tLS0K
X-Developer-Key: i=manos.pitsidianakis@linaro.org; a=openpgp;
 fpr=7C721DF9DB3CC7182311C0BF68BC211D47B421E1

Add a ``b4.auto-list-unreviewed` boolean config option (off by default) as
well as ``b4 prep --[no-]auto-list-unreviewed`` command to override it,
which uses a new "auto-list-unreviewed" dict key in the tracking json in
the cover letter commit.

When generating the cover letter, b4 will append a list of unreviewed
patches at the end, for example:

  Patches still missing "Reviewed-by: " tags:

  - [PATCH v94 05/75] Some change
  - [PATCH v94 30/75] Some other change
  - [PATCH v94 38/75] I tried my best to keep this series short but life had other plans

Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
---
 src/b4/command.py |  6 ++++++
 src/b4/ez.py      | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/src/b4/command.py b/src/b4/command.py
index 455124d..d1e63b5 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -307,6 +307,12 @@ def setup_parser() -> argparse.ArgumentParser:
     sp_prep = subparsers.add_parser('prep', help='Work on patch series to submit for mailing list review')
     sp_prep.add_argument('-c', '--auto-to-cc', action='store_true', default=False,
                          help='Automatically populate cover letter trailers with To and Cc addresses')
+    sp_prep.add_argument(
+        "--auto-list-unreviewed",
+        action=argparse.BooleanOptionalAction,
+        default=None,
+        help="Automatically populate cover letter with list of patches missing review tags",
+    )
     sp_prep.add_argument('--force-revision', metavar='N', type=int,
                          help='Force revision to be this number instead')
     sp_prep.add_argument('--set-prefixes', metavar='PREFIX', nargs='+',
diff --git a/src/b4/ez.py b/src/b4/ez.py
index 66875d7..dd48f39 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -80,6 +80,13 @@ Range-diff versus v${oldrev}:
 
 """
 
+DEFAULT_AUTO_LIST_UNREVIEWED_TEMPLATE = """
+
+Patches still missing "Reviewed-by: " tags:
+
+${patches}
+"""
+
 DEPS_HELP = """
 # All lines starting with # will be removed
 #
@@ -546,6 +553,10 @@ def start_new_series(cmdargs: argparse.Namespace) -> None:
                  '# auto-populate the To: and Cc: trailers based on the code being',
                  '# modified.',
                  '',
+                 '# For large series, it might be useful to point out which patches remain',
+                 '# without reviews. You can enable this with "b4 prep --auto-list-unreviewed"',
+                 '# and disable it with "b4 prep --no-auto-list-unreviewed"',
+                 '',
                  f'Signed-off-by: {uname} <{uemail}>',
                  '',
                  '',
@@ -1535,6 +1546,11 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
     revision = tracking['series'].get('revision')
     msgid_tpt = make_msgid_tpt(change_id, revision)
     seriests = int(time.time())
+    auto_list_unreviewed = (
+        tracking.get("auto-list-unreviewed", None)
+        if revision is not None and revision > 1
+        else False
+    )
 
     mailfrom = None
     if movefrom:
@@ -1563,6 +1579,24 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
                                                                   usebranch=usebranch)
 
     config = b4.get_main_config()
+
+    if (
+        auto_list_unreviewed is None
+        and (cfg_val := config.get("auto-list-unreviewed", None)) is not None
+    ):
+        auto_list_unreviewed = b4.get_git_bool(cfg_val)
+
+    if auto_list_unreviewed:
+        auto_list_unreviewed = []
+        for p in patches:
+            msg: EmailMessage = p[1]
+            trailers, _ = b4.LoreMessage.find_trailers(msg.as_string(), followup=False)
+            has_review = next((True for t in trailers if t.is_code_review), False)
+            if not has_review:
+                auto_list_unreviewed.append(msg["subject"])
+        if len(auto_list_unreviewed) == len(patches):
+            auto_list_unreviewed = []
+
     cover_template = DEFAULT_COVER_TEMPLATE
     if config.get('prep-cover-template'):
         # Try to load this template instead
@@ -1663,6 +1697,16 @@ def get_prep_branch_as_patches(movefrom: bool = True, thread: bool = True, addtr
         'prerequisites': prerequisites,
         'signature': b4.get_email_signature(),
     }
+    if auto_list_unreviewed:
+        auto_list_unreviewed_template = DEFAULT_AUTO_LIST_UNREVIEWED_TEMPLATE
+        au_tptvals = {
+            "patches": "\n".join(f"- {subject}" for subject in auto_list_unreviewed),
+        }
+        auto_list_unreviewed = Template(auto_list_unreviewed_template.lstrip()).safe_substitute(
+            au_tptvals
+        )
+        tptvals["cover"] = f"{tptvals['cover']}\n\n{auto_list_unreviewed}"
+
     if cover_template.find('${range_diff}') >= 0:
         if revision > 1:
             oldrev = revision - 1
@@ -2853,6 +2897,20 @@ def auto_to_cc() -> None:
 
     store_preflight_check('auto-to-cc')
 
+def set_auto_list_unreviewed(value: bool) -> None:
+    is_prep_branch(mustbe=True)
+    cover, tracking = load_cover()
+    revision = tracking["series"].get("revision")
+    if revision < 2:
+        logger.critical(
+            "CRITICAL: revision must be >v1 to generate unreviewed list (is v%s)",
+            revision,
+        )
+        sys.exit(1)
+    tracking["auto-list-unreviewed"] = value
+    store_cover(cover, tracking)
+    logger.info("Updated auto-list-unreviewed value.")
+
 
 def get_preflight_hash(usebranch: Optional[str] = None) -> str:
     global PFHASH_CACHE
@@ -2998,6 +3056,9 @@ def cmd_prep(cmdargs: argparse.Namespace) -> None:
     if cmdargs.auto_to_cc:
         auto_to_cc()
 
+    if cmdargs.auto_list_unreviewed:
+        set_auto_list_unreviewed(cmdargs.auto_list_unreviewed)
+
     if cmdargs.edit_cover:
         return edit_cover()
 

-- 
2.47.2

