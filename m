Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB72326927
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684052; cv=pass; b=jPe+E26uiKVaLTtE1tuuDTpNOlpWAIrHaeOzEPUOO8jod9coLLum6PUJZgzpDPAjxVFX6ifz7vekuJOjgdXgaTa3oDi3oDKpUmOa6KYufmdBr6fis2mqJcY3KlgEPsqrZXJRN3Q/A75fUOrbU+GGETUP3vU4dkshwFZeRgxylm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684052; c=relaxed/simple;
	bh=Yvmj6/lFPX1kwSwqzxi/7xS6XkDvi0OZn0fPTXuGQ8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FlenaLj+deo3SrQd78iE467nPxZ1Zc+8cE8Kjcix9FLe4r2QKQ5+XZ45YONMiH9sEXWIzMI1GwMFM21VYP4PKHb0ukNJVs6HzVxcoCTrJhsmXOo2Rlj6/gdwC12jbN6MUZD/ck6YmGHVQ+gYZ8ANdu5dx8/yeTY2sZWSlOJR2LI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=ajhiDyG2; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="ajhiDyG2"
Received: by smtp.kernel.org (Postfix)
	id CCB23C2BC87; Mon, 16 Mar 2026 18:00:52 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B8195C19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org B8195C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773684046; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YzsDuG0qkalrRyrvrFgXVdNpB0e/gaxFuRT/aFTmWNM3CKzlvgNFe1I7aTa7NiAbEr9IRkQ060vHKF9WY3679MuHJO02UNSEKXgyoc7xkL6MUL+AafA8/XIw+GqS9+pr+pNHjaTnkQ8Y8r9QsPtfsS+HQuyvl7DBjX7ISAzzW/c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773684046; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=zAby+houxlWUbhFri9ceBbVoGBjAAvvqar9AOJdsKQo=; 
	b=SK0cKyoQO6ix6jht5jJmYeVDZ4n5zc9Du9dNEGUp4ve01bxGJGRFbhREq4iKD6asGY43i7G0EfXJ8EjefQPHvocTIU3rDwZbBFodRub4teyIh71IssKzCty+lS8AfHyDyjjn6GZ4duxCYRCSO0NN+nb98e4NJfvWDYtRsWuEUws=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773684046;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=zAby+houxlWUbhFri9ceBbVoGBjAAvvqar9AOJdsKQo=;
	b=ajhiDyG25l7ElTU4jDyzq6YI8B+TM+yYgsuO6rW6RS19gRIyd8K4eLJ+k5LOV+mo
	v5BRAeLrN9bSTxTJuzvMAshLGh4cL9idPxdwPjtpxQhoGgL/PqeU5wWFkNb4uuxl3ze
	lwsTMCCCksrSLPQrTiTaHDi/6DWoykAt9p6Y/TgM=
Received: by mx.zohomail.com with SMTPS id 1773684040718980.7511609668184;
	Mon, 16 Mar 2026 11:00:40 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: rito@ritovision.com
Subject: [PATCH v1 4/6] add responsive extras and footer layout adjustments to contain overflow
Date: Mon, 16 Mar 2026 14:00:34 -0400
Message-ID: <20260316180036.71949-5-rito@ritovision.com>
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

Below 848px, fixed-width extras and footer blocks overflow the page and
create page-wide horizontal scrolling that breaks layout.

Make extras and footer sections responsive by switching extras to
wrapping layout, stacking blogroll/social blocks to full width, and
relaxing fixed heights/widths. Update donors to wrap logos and hide
manual <br> breaks so the sponsor area reflows naturally on small
screens.

Add 550px and 400px refinements to progressively reduce
blogroll/social column counts (3 -> 2 -> 1), preventing overlap and
preserving readability as viewport width shrinks.

This patch is intentionally limited to extras/footer behavior; content
and homepage table overflow handling are addressed separately.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: claude-opus-4-6
---
 korgi/static/css/main.css | 84 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/korgi/static/css/main.css b/korgi/static/css/main.css
index 19ee328..d20d8b6 100644
--- a/korgi/static/css/main.css
+++ b/korgi/static/css/main.css
@@ -360,4 +360,88 @@ dt {
     #banner li {
         padding: 0 0.5em;
     }
+
+    #extras {
+        width: auto;
+        margin: 1em;
+        display: flex;
+        flex-wrap: wrap;
+        gap: 1em;
+    }
+    #extras > div {
+        height: auto;
+    }
+    #extras > .blogroll {
+        float: none;
+        width: 100%;
+        padding: 0.5em 1em;
+        box-sizing: border-box;
+    }
+    #extras > .blogroll ul {
+        display: flex;
+        flex-wrap: wrap;
+        gap: 0.25em 1em;
+    }
+    #extras > .blogroll li {
+        width: auto;
+        float: none;
+        flex: 1 1 30%;
+    }
+    #extras > .social {
+        float: none;
+        width: 100%;
+        padding: 0.5em 1em;
+        box-sizing: border-box;
+    }
+    #extras > .social ul {
+        display: flex;
+        flex-wrap: wrap;
+        justify-content: space-between;
+        gap: 0.5em;
+    }
+    #extras > .social li {
+        flex: 1 1 30%;
+    }
+
+    #contentinfo {
+        width: auto;
+        margin: 1em;
+        padding-top: 2em;
+    }
+    #donors {
+        display: flex;
+        flex-wrap: wrap;
+        justify-content: center;
+        align-items: center;
+        gap: 1em;
+    }
+    #donors br {
+        display: none;
+    }
+    #donors img {
+        max-width: 120px;
+        height: auto;
+    }
+}
+
+@media screen and (max-width: 550px) {
+    #extras > .blogroll li {
+        flex: 1 1 45%;
+    }
+    #extras > .social ul {
+        display: block;
+        columns: 2;
+    }
+    #extras > .social li {
+        flex: none;
+    }
+}
+
+@media screen and (max-width: 400px) {
+    #extras > .blogroll li {
+        flex: 1 1 100%;
+    }
+    #extras > .social ul {
+        columns: 1;
+    }
 }
-- 
2.51.0

