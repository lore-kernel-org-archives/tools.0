Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EA6283FE3
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684051; cv=pass; b=cT+Mj7bNpo5ZqDrzhC9px4g2sEd2cZHPq281p8mNzA2CR9HgDA2PkTBL8lSRG2brKktR87n89HMGfTuWuIGefz6+nGMTgRMcRB2WHtcWO3moaLop1pGFz3zseCKYKxFYYnmKJUghIjalYbUCy5oS8cJfDeN4FvtiDZoni9PBpE4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684051; c=relaxed/simple;
	bh=wb/bjc561V0HXPyisHlVSP/gBIfLxj3p/AkKHx9MpKc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mx7ddEnN68IoYVDP9eYkCTtRaHJg4XagkD5AmQLGLnBl19IhS3hWq/FJSYmLKajwGpvCIB8TcR+n0Qj57QdMIgyagRjGGWGSghVQ/wtAfRAnXZdGVoul/+HdofUr6PqO+/WtamTcSZAzK17lD7gIr3dra/Miv4k7vf8DiPk9LwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ivPAbDzf; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ivPAbDzf"
Received: by smtp.kernel.org (Postfix)
	id C9B4CC19425; Mon, 16 Mar 2026 18:00:50 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id D4FDBC19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org D4FDBC19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773684044; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dygpuaawaBrn2IclyTyUfrL946t0v9gFUmdN1D7xQSd29Ik57eSny/NMII7WIy2GHPRTgegRhCeZjhPfyDEvcoAPKBAmf5E1yH+63f8i3ICwsB723NklEqAghVZeXTExjAdqfuXATI6PNic8ahKt67ZlafwaUxlsXz5qlNbBRS8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773684044; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Fr5EEyWZkRAiy7BOD5XZpummjpjTZp9GWQ40IVdMtKQ=; 
	b=QaDAy+7KHrF7crduYOVG5bIuICmu2xODpwzXxtsETJbqR2CAQZT9hJEqEI1zsMT5kFUmKezi5AWl1clcByBzRQwtw0AdE/NfpVpAA6AVgucRlQRlxWwFcEL//uH6YrkZijKXRwvc8cpWaaLLUB1xfLLb/N1twEhJsI210tWQHqo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773684044;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Fr5EEyWZkRAiy7BOD5XZpummjpjTZp9GWQ40IVdMtKQ=;
	b=ivPAbDzfJIeXZyIfwPT8Jq1Od3UG74nD3guDk+7RwxdkUmhdtqZQKTVhq1Pn7Bev
	QKdjb/fD9tNH9gpKLPPJ+ZL8RkWKfwGG8Lu0hM6iXRKF2IHfQwbIUAeWXrigH9/HOtS
	rfiUUpJMDsBftrHz251XKGXqKAZmIq4Ojb2MJYT0=
Received: by mx.zohomail.com with SMTPS id 1773684040166515.0898123850282;
	Mon, 16 Mar 2026 11:00:40 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: rito@ritovision.com
Subject: [PATCH v1 3/6] add 848px mobile banner adjustments to prevent overflow
Date: Mon, 16 Mar 2026 14:00:33 -0400
Message-ID: <20260316180036.71949-4-rito@ritovision.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260316180036.71949-1-rito@ritovision.com>
References: <20260316180036.71949-1-rito@ritovision.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

At widths below 848px, the desktop banner structure is too wide and
creates page-wide horizontal scroll overflow, breaking the layout.

Introduce a mobile breakpoint at 848px (equivalent to 53em at a 16px
base font size), matching the site's existing fixed-width layout scale.

Adjust banner sizing and spacing at this breakpoint while preserving
the existing desktop layout for viewport widths above it.

This patch is intentionally banner-only. The overall mobile layout
will still not render correctly until corresponding main-content and
footer overflow fixes are applied in follow-up commits.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: claude-opus-4-6
---
 korgi/static/css/main.css | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/korgi/static/css/main.css b/korgi/static/css/main.css
index 3b09d24..19ee328 100644
--- a/korgi/static/css/main.css
+++ b/korgi/static/css/main.css
@@ -339,3 +339,25 @@ dt {
 #logo-akamai {
     padding-bottom: 22px;
 }
+
+@media screen and (max-width: 848px) {
+    #banner {
+        width: auto;
+        margin: 0;
+        border-radius: 0;
+        border-left: none;
+        border-right: none;
+        border-top: none;
+    }
+    #banner h1 {
+        font-size: 2em;
+        margin: 0.5em 0;
+    }
+    #tux-gear {
+        width: 4em;
+        height: 5em;
+    }
+    #banner li {
+        padding: 0 0.5em;
+    }
+}
-- 
2.51.0

