Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268A133A6F9
	for <tools@linux.kernel.org>; Mon, 16 Mar 2026 18:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=10.30.226.201
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773684049; cv=pass; b=oyvtHz4pU14szxfUmLkRwS6ztBbrsBEm9XcrY9xRzqF9V0avD1fXBtkevtxSNb98AKofS67aYQ9qQK9bMKhU9/aVa5dEMVVcTPsA/ZWLjFpk1x1MaboFc8IgFxy2L+5Bn6wW/0MJjQdXRYSXVHU4EMmwrx7zNQH+xGSsuUbtGIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773684049; c=relaxed/simple;
	bh=vNMagfXcSwrrbWC0Bms+5Yab6Uq/L2PMaQZNKNYfv68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ppirNbPEVdQQ6DCR/fBYLd0W5hBTPMRmLlfg+GnJoivbADxGfppGJBSmEN6mov7prLLY/w0ZH0eCz0atG8ZtF4704gg5B4BVe0XtBNJToLCjjjeJG1pBAnshWaciT2YxChnkW0QcNTMwM7u7Ib7WobnBn0o6q8yr4FL2WMACGGY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b=DmBzgUR7; arc=pass smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ritovision.com header.i=rito@ritovision.com header.b="DmBzgUR7"
Received: by smtp.kernel.org (Postfix)
	id ECF99C2BC87; Mon, 16 Mar 2026 18:00:48 +0000 (UTC)
Received: from sender4-op-o15.zoho.com (sender4-op-o15.zoho.com [136.143.188.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id EBFB7C19421
	for <tools@kernel.org>; Mon, 16 Mar 2026 18:00:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org EBFB7C19421
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=ritovision.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=ritovision.com
ARC-Seal: i=1; a=rsa-sha256; t=1773684043; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=g6nAwehyE8aToXcVIDd4v0QhL856tdNaRDh9XXyLrQBExMRo4eV65ghTPL4n2L0xJfD51r6cJdOC1MB4XHJFvMMfhPB2RdewIdPrhQWOIAXzqN0//4gaV8GhAaLQyXSf0kfPEOnKTxeLGf/Efll+oYbFbRjmP2aeuNQg7zVfgcU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1773684043; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=640C6bY0JkPzlEGnNnfBlqcHhiuDpTbo9eVMNLlA01M=; 
	b=JDnjaJ3R4CgRRr6boOKl5v8SY1LKZohpY2Q0m43hTA6pQzeWYpq4HF9VX27/MZFo3zExJ5WxxKOryuv3RreTHBPTWumf4+csEb/VyXMkNBKPASr9pZv8N+di2ZInYm+B9euogXIpn2EBuHfC/oeDfK5gJ+rz435XieWPD1c0K2w=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ritovision.com;
	spf=pass  smtp.mailfrom=rito@ritovision.com;
	dmarc=pass header.from=<rito@ritovision.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1773684043;
	s=zmail; d=ritovision.com; i=rito@ritovision.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=640C6bY0JkPzlEGnNnfBlqcHhiuDpTbo9eVMNLlA01M=;
	b=DmBzgUR7W7RxjdY38lpXIiGF/g0AGpHSIGVeDiUwl+bjESsre0t/wGb2MkmufJB3
	Wd6v2JkmVFOQhYWelhLvuJafkm0lbeZxseBCtrcqCHCOmJdUJl2gMQzgINxsKT8K7lb
	JhdF72wt6AT66uHFPKQTsi3t6BJh4vIcLKLR9ym4=
Received: by mx.zohomail.com with SMTPS id 1773684039458277.35800794057;
	Mon, 16 Mar 2026 11:00:39 -0700 (PDT)
From: Rito Rhymes <rito@ritovision.com>
To: tools@kernel.org
Cc: rito@ritovision.com
Subject: [PATCH v1 2/6] prevent wrapped headings from overlapping with text above it
Date: Mon, 16 Mar 2026 14:00:32 -0400
Message-ID: <20260316180036.71949-3-rito@ritovision.com>
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

The Oswald heading font has tall ascenders/descenders, and at the
prior line-height wrapped heading lines can visually overlap adjacent
text above, reducing legibility. This is most noticeable on mobile,
especially in the desktop banner where the title wraps and overlaps
with itself.

Apply this as a global heading rule as a consistent policy for
anywhere heading wrap can occur. Some desktop views may not show the
issue yet due to available width, but the underlying font behavior is
the same and can surface as content or layout changes.

Adjust banner heading and nav spacing to offset the line-height
change, preserving the original desktop banner visual layout.

Signed-off-by: Rito Rhymes <rito@ritovision.com>
Assisted-by: claude-opus-4-6
---
 korgi/static/css/main.css | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/korgi/static/css/main.css b/korgi/static/css/main.css
index 7d73395..3b09d24 100644
--- a/korgi/static/css/main.css
+++ b/korgi/static/css/main.css
@@ -68,7 +68,7 @@ body {
     float: right;
 }
 #banner h1 {
-    margin: 28px 0 47px .05em;
+    margin: 12px 0 31px .05em;
     text-shadow: 3px 3px 0 #F8F4EE;
     font-size: 3em;
 }
@@ -78,7 +78,7 @@ body {
 }
 #banner ul {
     padding: 0;
-    margin: 0;
+    margin: 0 100px 0 0;
     font-size: 1.1em;
     font-weight: bold;
     list-style: none;
@@ -99,6 +99,7 @@ body {
 
 h1, h2, h3, h4, h5, h6 {
     font-family: oswald,helvetica,sans-serif;
+    line-height: 1.1;
 }
 
 a {
-- 
2.51.0

