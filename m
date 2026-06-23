Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA554175A74
	for <tools@linux.kernel.org>; Tue, 23 Jun 2026 06:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782197847; cv=pass; b=orerkVd3DEzb8J0SoELFPVRqoQqoRIkPYsu4QaCTfHKYWzsAe2D0nyb95C/B8ClRWD8WZrh7cMwBhyx/7IKXFegmnzIEN/FwUzpNob0B5XTaL6jTK7rQcFEFVsTxDlmOxYy0jz7qvSWDjix57C0M9sVvE/KTZdvedGqiQPQSpxg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782197847; c=relaxed/simple;
	bh=r/I60qK+9mS82nbbeP7h/gI/Q6AdKRPGxXWV4mkH8nM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=TdnYpHBiNJBYYHKjpzr8CwzSrbiY5DAomfHagCnDnr8/OJGvGRVrYRPf2GfMZQknNv7EW/XR5Fet/qgZYM4sPy9M9ZAjfNiKB2aKUk0hnCAZEECol1aDJ8QYild8Ak0l4QPAtr0OKYnItbJBX1yQPR+Pu7Vw3lXsBs/1alUYk/4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ldeUzphD; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ldeUzphD"
Received: by smtp.kernel.org (Postfix)
	id 558091F00A3A; Tue, 23 Jun 2026 06:57:26 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1782197846;
	b=21vqJ03B81WN2mJ6TyrXnVKHM+wQcjQ3Evfc195lbHCD/hZEidxT6fHXBcvTBLbBlvJz
	 UTu6MtL93YUwwGPADmAhmyw27txHxVhD21exHPMV7vbd8e5SWobvzZ9hOuKpTYCLPTxaa
	 CHwDR9BaCyzM8gqBR2AhzdMviUnEqcDoRKvkR99v0RvybVN9Dam7eDsM6oNEjUuBSQYt6
	 +7LPnKdU4PbWVjQ4b6cqxRlFDcK+h4wNdgpU8DExTTPt2ydn7HaJLyTN5bvVhH8hu9iX7
	 TuxZmbs6xJaO60T3Ik750Fxtj4SvdWnNPVnvtBkKkBldLQfNoLjz/P99ZAwty1EEbpw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1782197846;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=CZNO6GOdiPP09u4ZsJ+8cEBT9CR05DQD8U5KgioWygg=;
	b=u8lhgw6SX43uq1eFaOJNkbBsqRadRI2JqlHTDBUEECwRp8ydWYVkZkzg9abdwwVF/1m5
	 lFvSaXeaPuNkquof4xbk/s8AiQk+dpmscEjF/LWfclRHupAG90xJpmo4GtTKIKzgyTKGF
	 EhfPVODqBUUri5zlpHIvcIYyUZWB8LFULoOVPZfv05EljdsatcvTSAKru1ZHkh2BKicsd
	 6Bxy23WQ+t6Kh0lfzWNosy474C6VbNTEp6i1SF8by4/Sy4aF1AFJBuYrWw/e6aP/Cwjjd
	 kDkhDkZmYDyyHetnLFpes2RFxgoxzU1egONbY4LAK5usVJYNQa4DWLuVRSbDcleYb1Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ldeUzphD;
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC95F1F000E9
	for <tools@kernel.org>; Tue, 23 Jun 2026 06:57:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ldeUzphD
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BC95F1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1397e093f90so2783031c88.1
        for <tools@kernel.org>; Mon, 22 Jun 2026 23:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782197845; x=1782802645; darn=kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CZNO6GOdiPP09u4ZsJ+8cEBT9CR05DQD8U5KgioWygg=;
        b=ldeUzphDxxQfjbRyBQCD7GFab/3HfLdMr+Xk9PRz41shFxjg385wW5nspML16vPpn5
         7m3SEdFd4zUTl6WPrFbNtgksvdbxinaZaCMJqpRizb/czP6G5CNQpnLYsMra7OwAXIYT
         Iv6m5WxuLUak5ho+9SlcllWlUQW1CYEAOVLlismMDBsAGTijZ186bMUZk3HodQqoAliT
         oSCRg22O7EhiE2sHx3Wjf53NejKDzPP3IbGnxzPp+62ICpvCeB8vSLSH3u+HMj/Fo/W3
         qPoP1mVkGwUsyhQiKitB1Zsx3VgBHNGXat3dxdVOOhDPbxfE2aosq+P1CooczfoRxZu+
         nfSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782197845; x=1782802645;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CZNO6GOdiPP09u4ZsJ+8cEBT9CR05DQD8U5KgioWygg=;
        b=B4B0Onr42PmIpdIPFaM+vvUmX0Qmc33ExhmnfoXrPQcJc4Zx6rPeRzJmI4qo9IQ//s
         vU+4w8gVW1rAwti8K53k/bhzn/TnvTIOB6/MzQ8n0IAqz6C6zMETMey+pMEz/Ph5Dx8o
         QTzs/EooS8FTB+vmi2EB757titDcHnnG+/37k4FMbEwyenFplkYGHLDUR6MNMf5RJxfd
         K6ALoQfAJNsDAaz1+Wt0DoF+QylNDkcajsQnhrQc5RVpdbcDSmx/M6LgZAq4Da/bPj99
         ur5v3cwSabHlzIIT7fE32GDmLragwqV3onvJnnXj+yYNnYOZ3J3ARlVAKGM+Myk+xxmv
         0eWg==
X-Gm-Message-State: AOJu0YwDArmYQYV9BnrsrnfT1/Ef9a8KM0rGl+BRUXTk2arJtaBe51Os
	o6brqGEMbtpgrEtjq8BdYl8xceg5YR+xczYc8O3R7HmwGlcPiJSOVaYkG4Fgg4Uz
X-Gm-Gg: AfdE7ck3h2jA9OhpbkZCqzTW/0vMc0qEoKCt9/0A18ntiAgiONSxOppn9PKOj00TCdi
	zoLtKP4bNYlv2AFnnvuVVPaiBLjXfxRz7DL+znpqqvL9wmzkuy3VoXua7hQIS+hcXre5EDCrdkr
	U0dhwtqEQxHzEUHKYgW0qxecqcrZV93ngmBsA35NN7VyPncl9zPUO8yLZq2x6aKFfwKAuGxxKO9
	nvb1aR0Qte+RXtJQwoP5Q5lkP7tLUaKEiLsHcgqcpj9yajBzH4PrIt7llH1r4ru3x2TAOOP1fHJ
	ShIGvauaerf1oKRgJBOyRf2cokpeJfHiC1xjfwrwiVRD5WIvHmNvLQPFv7vSjLQTthO1xnRIug8
	oFjKEfhDhstrOm9muQAvMx5c4maM8WpofXsQU7thU7chniYpXUWwjdz7VSjB1fEwclZxclynp+W
	shCQbrTmRsq45qNPi1/w==
X-Received: by 2002:a05:7022:492:b0:138:37a4:fcc1 with SMTP id a92af1059eb24-139a34f4a49mr10807158c88.12.1782197844694;
        Mon, 22 Jun 2026 23:57:24 -0700 (PDT)
Received: from [10.0.0.65] ([2601:647:6700:64d0::92d1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add6d76dsm11383336c88.12.2026.06.22.23.57.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 23:57:24 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Mon, 22 Jun 2026 23:56:52 -0700
Subject: [PATCH b4] review-tui: Use review-signature-template for signature
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260622-review_tui_template-v1-1-f4b7d5a453ca@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWM4QqCMBhFX0Xu7wZzyLReJUI2vdYXZbJNC8R3b
 9bPc7nnrIgMwohTsSJwkSivMUN5KNDd3Hilkj4zjDZWW2PUfuK7TbO0ic/p4RLV4JvK6mNTu9I
 hm1PgIJ9f9Qxf4fLf4uzv7NKew7Z9AZ+BMul7AAAA
X-Change-ID: 20260622-review_tui_template-fb8460987a1a
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782197843; l=4799;
 i=thecharlesjenkins@gmail.com; s=20260605; h=from:subject:message-id;
 bh=r/I60qK+9mS82nbbeP7h/gI/Q6AdKRPGxXWV4mkH8nM=;
 b=uYTgUq7u8fAD7akjHV8EiP9ovs8bYjJqjk85Tr6ZjWd5uv6UpLqa97EyuReqlX90/sBNOQ7gz
 uXf2ZY26HVwCHQa3hNVhfrnGsmRDhj2eu8F8jqycKw4Gt/0ZENKh718
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=ajnnRQ98PIdwKp4HeMkq9U32okYbnh6Zb4G3o5XXvkg=

Follow the pattern of the other tools and use a template for the email
sent through the review-tui. This is a bit different from the other
templates because it is only for the signature and tries to only add the
signature if it is not already present.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
I felt like the review signature strayed away from how the other b4
commands worked so here's an implementation of how a template could be
used for the review tui flow. I tried to keep the spirit of the existing
code by checking if the signature already exists. I know this is still
in alpha but this change was easy enough for me to draft up in case you
were interested :)
---
 docs/config.rst                                    | 10 ++++++
 src/b4/__init__.py                                 |  2 ++
 src/b4/review/_review.py                           | 36 +++++++++++++++++++---
 src/b4/templates/review-signature-template.example |  6 ++++
 4 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/docs/config.rst b/docs/config.rst
index 7b279e4..a304fb5 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -598,6 +598,16 @@ These settings control ``b4 review`` TUI behaviour.
 
      .. versionadded:: v0.15
 
+   :term:`b4.review-signature-template`
+     Path to the template to use for the review signature. The template supports the
+     following tokens:
+
+     * ``${signature}``: your signature, either from ``~/.signature`` if found, or from your Git config
+
+     Default: ``None``
+
+     .. versionadded:: v0.16
+
 .. _patchwork_settings:
 
 Patchwork integration settings
diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 4cb6e72..ba74417 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -183,6 +183,8 @@ DEFAULT_CONFIG: ConfigDictT = {
     # (review replies, follow-up replies, and thank-you notes). Series patches sent
     # with "b4 prep/send" keep their templated message-ids and are not affected.
     'custom-msgid-cmd': None,
+    # See review-signature-template.example
+    'review-signature-template': None,
 }
 
 # This is where we store actual config
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index 7a4e606..048c830 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -15,6 +15,7 @@ import re
 import shutil
 import sys
 import urllib.parse
+from string import Template
 from typing import Any, Callable, Dict, List, NamedTuple, Optional, Set, Tuple, Union
 
 import liblore.utils
@@ -35,6 +36,17 @@ COMMIT_MESSAGE_PATH = ':message'
 _REPLY_CONTEXT_LINES = 5
 
 
+DEFAULT_REVIEW_SIGNATURE_TEMPLATE = (
+    """
+Best regards,
+--"""
+    + ' '
+    + """
+${signature}
+"""
+)
+
+
 def _should_promote_waiting(newer_vers: List[int], previously_known: Set[int]) -> bool:
     """Decide whether a waiting series should be promoted to reviewing.
 
@@ -2647,10 +2659,26 @@ def _build_review_email(
     if not reply_text:
         body = _ensure_trailers_in_body(body, trailers)
 
-    # Append signature if not already present
-    if '\n-- \n' not in body:
-        signature = b4.get_email_signature()
-        body = body.rstrip('\n') + '\n\n-- \n' + signature
+    review_template = DEFAULT_REVIEW_SIGNATURE_TEMPLATE
+    config = b4.get_main_config()
+    _ctpr = config.get('review-signature-template')
+
+    if isinstance(_ctpr, str) and _ctpr:
+        # Try to load this template instead
+        try:
+            review_template = b4.read_template(_ctpr)
+        except FileNotFoundError:
+            logger.critical(
+                'ERROR: review-signature-template says to use %s, but it does not exist',
+                config['review-signature-template'],
+            )
+            sys.exit(2)
+
+    jsondata = {'signature': b4.get_email_signature()}
+    review_signature = Template(review_template).safe_substitute(jsondata)
+
+    if review_signature.strip('\n') not in body:
+        body = body.rstrip('\n') + '\n\n' + f"'{review_signature}'"
 
     # Construct the EmailMessage
     user_name, user_email = b4.get_mailfrom()
diff --git a/src/b4/templates/review-signature-template.example b/src/b4/templates/review-signature-template.example
new file mode 100644
index 0000000..dc45499
--- /dev/null
+++ b/src/b4/templates/review-signature-template.example
@@ -0,0 +1,6 @@
+# Lines starting with '#' will be removed
+Best regards,
+--
+# if ~/.signature exists, it will be put here, otherwise
+# the contents will be "user.name <user.email>" from gitconfig
+${signature}

---
base-commit: e7e48f19f7a553e80dea9c8dd267887cb3a3cf09
change-id: 20260622-review_tui_template-fb8460987a1a

Best regards,
--  
- Charlie

