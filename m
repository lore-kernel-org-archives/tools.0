Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9BD13B0AFB
	for <tools@linux.kernel.org>; Mon, 23 Mar 2026 17:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774286259; cv=none; b=kgeudX3EMqiR8aozObRjB6IKScwsrkEI3mNjBBfXb2O4oPkopF5YTWq6IKhulvHA8MIfExYkRux2afopsxAP5W4MsNti/R7CdpB2iZksat3sIbyb7dhXhgSKMG2Mm0TuFtrhwkO3w+jnJS/qY+wHws4GLQXtReGReCMSp1PTyhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774286259; c=relaxed/simple;
	bh=5jdEyqBSLK1XkmMgLk+10OaSR24whlQ8IUnS1t53f8w=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=TuzA1+CNf4V8vrXT7csRKX+PjQ4ZYVMWzt832AYcBU/7ru6DLJGAHY/LiQgjWI95DHv+oWMDTGotI2ig7nvL4iy6z15tKEGiNyCoJ5RQEXjWwqyrGVw7EpJmLBlLVN7YSNELUgWoKhuceq9RMtz4FG/xLl61GSPhDT2KmnW9I50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WqIkKj38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WqIkKj38"
Received: by smtp.kernel.org (Postfix)
	id 53D21C4CEF7; Mon, 23 Mar 2026 17:17:38 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 13D8AC2BC9E
	for <tools@kernel.org>; Mon, 23 Mar 2026 17:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 13D8AC2BC9E
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774286255;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z1BhsKwzr/J+LAJ63YJNYxp8lqY3w2eTihNsAyWCJa0=;
	b=WqIkKj388+1u/To5jEd5OjO8PVjvHVPc4STDaULKFD4NmnutHWKPujjkgaQfSykgrmWeyC
	zifaOtaV6UylHKriqOVAAmY8RaUrweDOlXfr/x3YuXlcNVv3y5ViBmH4spFWV9UzW12idw
	7eeDSpUn8+IOGdKn1CQpFFGnfB6VOAk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-651-wQfVaGDzNo24-3AKtyhGHw-1; Mon,
 23 Mar 2026 13:17:34 -0400
X-MC-Unique: wQfVaGDzNo24-3AKtyhGHw-1
X-Mimecast-MFC-AGG-ID: wQfVaGDzNo24-3AKtyhGHw_1774286253
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C96919560A7;
	Mon, 23 Mar 2026 17:17:33 +0000 (UTC)
Received: from jlelli-thinkpadt14gen4.remote.csb (unknown [10.45.224.82])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 09DBB180075B;
	Mon, 23 Mar 2026 17:17:31 +0000 (UTC)
From: Juri Lelli <juri.lelli@redhat.com>
Date: Mon, 23 Mar 2026 18:17:07 +0100
Subject: [PATCH RFC] review: add support for custom analysis methodology
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Message-Id: <20260323-methodology-hook-v1-1-5c669c0c564f@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYyNj3dzUkoz8lPyc/PRK3Yz8/Gxdi7RU45QUcxOLZIsUJaC2gqLUtMw
 KsJHRSkFuzkqxEMHi0qSs1OQSkGFKtbUALLZzBHkAAAA=
X-Change-ID: 20260323-methodology-hook-8fe3dd748c8d
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Chris Mason <clm@meta.com>, Juri Lelli <juri.lelli@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774286251; l=5326;
 i=juri.lelli@redhat.com; s=20250626; h=from:subject:message-id;
 bh=5jdEyqBSLK1XkmMgLk+10OaSR24whlQ8IUnS1t53f8w=;
 b=ScTDkBvEaeGdh8PvlodLGjuj728nss64P/IBbtrRxI7ir1wiIe8dfrpxh4x7VZofOaVStJTlK
 1hSbVd5JzcbDv4HRBLK7ImKDD0ltlKuQ4eoAykslXIys7H184UWuo4w
X-Developer-Key: i=juri.lelli@redhat.com; a=ed25519;
 pk=kSwf88oiY/PYrNMRL/tjuBPiSGzc+U3bD13Zag6wO5Q=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: USo-x3Rfpxj36A7CgXI5IEcLokhCjbEgJiBHefL129w_1774286253
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a hook mechanism allowing maintainers to augment the stock
agent-reviewer.md prompt with custom analysis methodologies via
.git/review-methodology.md.

When this file exists, the AI agent loads and follows it before writing
review files, enabling deep analysis workflows (e.g., semantic code
analysis, subsystem-specific patterns, false-positive elimination) while
maintaining b4's expected output format.

Update agent-reviewer.md to check for the methodology file immediately
after safety rules, and added documentation in review.rst explaining how
to configure custom methodologies.

Assisted-by: Claude Code:claude-sonnet-4-5
Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
---
The current b4 review AI agent integration uses a stock prompt
(misc/agent-reviewer.md) that defines the output format and safety rules.
This works well for basic reviews but doesn't accommodate maintainers who
have existing deep analysis workflows with subsystem-specific patterns and
verification procedures.

This patch adds an optional hook that checks for .git/review-methodology.md
in the repository being reviewed. When present, the AI agent loads and
follows this custom methodology before writing review files. The stock
prompt continues to define where and how to save results in b4's expected
format, while the custom methodology defines what to analyze and how to
verify findings.

This separation allows maintainers to integrate tools like semantic code
analysis, subsystem-specific checkers, and false-positive elimination
procedures without modifying b4 itself. I've been using this approach to
integrate comprehensive Linux kernel review protocols [1] with b4's workflow,
and it seems to work well in practice.

The change is backward compatible - when no custom methodology file exists,
the agent proceeds with standard review analysis as before.

1 - https://github.com/masoncl/review-prompts
---
 docs/maintainer/review.rst | 26 ++++++++++++++++++++++++++
 misc/agent-reviewer.md     | 28 ++++++++++++++++++++++++++++
 2 files changed, 54 insertions(+)

diff --git a/docs/maintainer/review.rst b/docs/maintainer/review.rst
index 8c8b77a..c944605 100644
--- a/docs/maintainer/review.rst
+++ b/docs/maintainer/review.rst
@@ -1106,6 +1106,32 @@ for your project. A sample prompt is included in
 repository and adapt it to your project's coding standards and review
 guidelines.
 
+**Customising the analysis methodology**
+
+The stock ``agent-reviewer.md`` prompt defines the output format and
+safety rules, but you can augment it with your own analysis methodology
+by creating ``.git/review-methodology.md`` in your kernel tree.
+
+When this file exists, the agent will load and follow it before writing
+review files. This allows you to:
+
+* Define deep context-gathering steps (e.g., using semantic code analysis)
+* Specify subsystem-specific analysis patterns
+* Add verification and false-positive elimination procedures
+* Enforce additional quality standards
+
+The custom methodology defines **what** to analyze and **how** to verify
+findings; ``agent-reviewer.md`` defines **where** and **how** to save
+results in the b4 format.
+
+For example, you can create a symlink to your existing review prompts::
+
+    ln -s ~/review-prompts/kernel/review-core.md \\
+          .git/review-methodology.md
+
+Or create a custom methodology file directly in ``.git/``. The agent
+will automatically detect and use it when reviewing patches.
+
 .. _customising_theme:
 
 Customising the colour theme
diff --git a/misc/agent-reviewer.md b/misc/agent-reviewer.md
index 2bb0853..4ee9fea 100644
--- a/misc/agent-reviewer.md
+++ b/misc/agent-reviewer.md
@@ -22,6 +22,34 @@ actions are prohibited to you:
   contents
 - Executing any test frameworks or any other CI commands
 
+## Custom analysis methodology (IMPORTANT - CHECK FIRST)
+
+**BEFORE starting your review**, check if `.git/review-methodology.md` exists
+in the repository:
+
+```shell
+cat .git/review-methodology.md
+```
+
+If this file exists, **YOU MUST READ IT IMMEDIATELY AND FOLLOW ITS ENTIRE
+PROTOCOL** for analyzing patches. Custom methodologies define:
+
+- How to gather context (e.g., using semantic code analysis tools)
+- Subsystem-specific analysis patterns and verification steps
+- What checks to perform and how to verify findings
+- Additional quality standards beyond basic review
+
+**Integration with this document:**
+- The custom methodology defines WHAT to analyze and HOW to analyze it
+- This document (agent-reviewer.md) defines WHERE and HOW to save results
+- Follow the custom methodology for analysis, then transform findings into
+  b4's review file format (identity.txt, NNNN.txt, series.txt) as specified
+  in the "How to save review data" section below
+- All safety rules above remain in effect regardless of methodology
+
+If `.git/review-methodology.md` does NOT exist, proceed with standard review
+analysis as described in this document.
+
 ## Branch layout
 
 A review branch has the name `b4/review/<change-id>`. Its commits

---
base-commit: bc4c73c5333d7d88428e4ce970facd48d6b8b107
change-id: 20260323-methodology-hook-8fe3dd748c8d

Best regards,
--  
Juri Lelli <juri.lelli@redhat.com>

