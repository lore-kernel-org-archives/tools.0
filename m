Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793730823;
	b=zoZ022v7/r7FbfuYrK7D/Eh7FmUqh47EtLuXPVA4M+c9HYIzl6JM1J9kzrS9e5ua/CsH
	 blJCqsEJF4JLEcXcwkiYYOrXOeOsFXROTK/9oqJy7eTYTWz9kYX2yIjxWzS1MIW4kb6vL
	 fRGTujnQyYPe2KYo1iwBYj+NdHbQY7H+eNApDlnVh4tUxWg0u63jSeQj7kABV/ApeOA/5
	 dlinXgpNVPa39d5bnOpJDlAQsvnD5TqcDo/n4rdfewp/asRNmoAmoqlnaZnxfUMDqa1dc
	 JNCAWDbbhEDzgxFBVWxcBDMFbV9UtGklBu3TIiXMIGMameO5G5yT4qTG4iUNSc89aBg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793730823;
	h=Received:Delivered-To:Received:DMARC-Filter:Received:DKIM-Signature:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=hY1HrO25UA2ndJ4TnJo27IWe5GCPudxhroEdvpcqBU8=;
	b=ufhV4qRMpn7WwLeW25hX7XSJx/PwE0DxjYSytOw+rp3uDZCU2uLWpxu+E/sre/VaWef+
	 tvEINj5s73nxhGS/K742cljzT6VuLA8jy1lxzMxbz+5AVIs6emqDeYpV/yghTqQzT8gA2
	 nCN4p5rTsczsYD1RNKxdw/1gNIcFHlRyhwPK0DADP+QggWqmVWLZhwnWht4sNkVaayY7l
	 VuBwW3w1lGoYWXtewrx091jiqe431ED05i7SJEroA5QUQEU5p81XDY68bKfgmzGzjzQV+
	 MGQzaZO8bR6iTzl5uA9JB3tAPYiXX9sIwQe4TGES3fXBNKQMYPuuvHxTuFI8RBM+CCA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LclW/Td7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 766B7606A31B
	for <tools@linux.kernel.org>; Tue,  3 Nov 2026 18:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LclW/Td7
Received: by smtp.kernel.org (Postfix)
	id 2DE1C1F00A2B; Tue,  3 Nov 2026 18:33:43 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793730823;
	b=tVfST2PSSG/Y7p14UkbAporJ8ja3UPMPUNiNgKPzBEKr0qjLUX0hKyct4Db+I2GinnET
	 TVUOhI6YSxX95fci0plYgcCRucHPKd63IHcDNevimFe/bi9jc9ISR03tY/4l8AWjajorY
	 HHeuufWP5smS+UoYp5m8rzNxdinPqlld+gRay0r678SCWYXc+RMwEHTv57wa7oCzyvfLC
	 o90Fp0UwJyNGpyMPnSMctRRklxZXR/mQJXwGjz148Zh2DLaBI9ybmClQyBkCKqFqPgHUs
	 CeyV0lzYv4GBqbLGFEhskPHEbobWBwJ+7dJIjqz9Z0gtxZ2V7I6w42lEgBVUguXvnHg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793730823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=hY1HrO25UA2ndJ4TnJo27IWe5GCPudxhroEdvpcqBU8=;
	b=NC0m7gLU7m0TamkYNuxRpTFtIvqx6zzcgCgIhXYdp9OzvXV6Jwn8bkpe+gth5VK6IZm/
	 d02oEZXJx67O2r+0UAb+pjUrDn92LSahUEzINI8HVrWi3sNAO7Gz9htsftbSg2ljQXJEM
	 GW/qIpMmn7h6w1wffzfdNnM5yi/KrusbOZhIiAvBeRMx8UdfogcZXtVPjxox90S0a8WIs
	 wATh67Xd2xUA8c6m4I6SQ8nSBq+ybfXEzp7G5l3hdddmegCS6iPu5T/RDytVPlKtGlCrO
	 /eGmbzed/1tqi+ka5bM4BOhYtF5NFGiUGmyuMmRxlxMVIvsgXYkOysYWQlcpg26mZ1A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="LclW/Td7";
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8FF771F0093A
	for <tools@kernel.org>; Tue,  3 Nov 2026 18:33:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LclW/Td7
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 8FF771F0093A
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a215e64962so42259165e9.1
        for <tools@kernel.org>; Tue, 03 Nov 2026 10:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793730816; x=1794335616; darn=kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hY1HrO25UA2ndJ4TnJo27IWe5GCPudxhroEdvpcqBU8=;
        b=LclW/Td7NKizhQRqSk9WuEi6v4y6ZrYZ4kUovUnQSo23lT3i5nj7W46CBHuGNNAy89
         qoPUdii/3DOIAAN3LgCUjmlnFjgHBMEASdzOJMHAVAHnmaCehxJnH/cAjRweVQ+QHSmX
         SOncwZ6qjuARfII4fI5f/Epz0UU9yGw0fkxGdu53cqp1m6RwVK2JOPYcHIS1J5BOlToJ
         FJmpcY/7yVczGYBJz3Ei38RTOjibowoKXivfK3piDpD4nH/BD3Mt3JJgwvrAmn9y6qcZ
         bi+kwt/c185ZG3dk5KxpElILg44mxNN7hsrm4mCGLyjFR/Xcc8QrXeXS/HXxPJlsWHkL
         S47g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793730816; x=1794335616;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hY1HrO25UA2ndJ4TnJo27IWe5GCPudxhroEdvpcqBU8=;
        b=xtEwLToSz6kiUdNm8YkKg3q4InA6UcPlanWUtBgp5Cv/KoiCHXuN5hCpttN9o1hCiN
         tJ0webeqGjxYMRDp+EM9LaJnsIkAUNaXm+++38Yov8xurDFq/ilbCsnOYSV4UNp1HyRg
         beuYu+KZj0L/KflxgztwQiXw7+KCEfuSR7FluVev32CX4I56v91y65kxU57T17/zbXvB
         kNhv4uK2sLyOAugcRltwLvDDviM3xbNa8FKrB67dUgfR1sf4M5qoblaApz1HxbcHRRAF
         ibLR/sFpw5lLPZcVFs7P0JcSKZ8xlSNFtRzierGq+lsw2wsgFa+H/Ptmic5JwcxU3zf2
         N8lw==
X-Gm-Message-State: APuU4Z9yoqDQiTdva9I7bCrqpGWeWmAqsR6dIMRL/R1mL5IUsOp5z9hb
	43KMl2FVgollbn1xAfEOicV7N61RORHhyRheskup5JgnYObyBM77dtF3Zx9SHBOz
X-Gm-Gg: AYBFou3g6qs7BJy7Vs476d8iXU+EVLMc96zUr24TkaGOw6TVKjdOECTvo6RVMF2Qz2X
	WQM2bGQQ5JctM7M12qmBpDjldVFvrOUdGcVVH4LjYBtr9D0c6Y7zIelMzfHIFCOXqKTRvIwaYZu
	M4x8/zHIRTOT7AYpUVXcFvn/0lubesApSMk88YfvyhLUgDd/ItED1GwfRT3imudclyA/ifbqLwy
	MR080ADHsPWMAfWeBZ5K5pIZb+8Lnf1/8EjAP58TySg8seU6R66716NTd0zkmdCB0Z8kmKzBZ1U
	G1xGfDJGstP02MJ/Pok2WDTcHmEd8/n893RMim18ImxnNQ+0VkZCMFtI9wU1lQE/5wAGUGmWVov
	NHQ9WwZn/oJe3jFiPyIaWtL+WTBgrXjTM9ER/HNyyH94+IHSDIjbFdfXX4dtRFTfczHxGq2aA11
	nVXHggDJmqhbM7COWe9ieUUnC7Ua5kmRreioTkc5j/1LOiSg5DiO7Hx2ut71PDdDEUolme++Gp8
	PbJAeA08TNNWg7eww3m4JDppcf9Og5uNgM5XXA4NHLq0oqs/CecDSJsjAzoNNxo11l3HeCFjXzN
	RXqRajyd23hOqwAIrDcLtEGxNWpYDD18oLB4qjIJoWERs13qhM4+WC/YBUu/UKnpFoA=
X-Received: by 2002:a05:600c:3b0e:b0:4a7:7d22:c50c with SMTP id 5b1f17b1804b1-4ac150b2243mr349745755e9.2.1793730816033;
        Tue, 03 Nov 2026 10:33:36 -0800 (PST)
Received: from 990pro.localdomain ([185.68.248.203])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b40ff10f00sm1749315e9.2.2026.11.03.10.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 10:33:35 -0800 (PST)
From: Bernhard Kaindl <bernhardkaindl7@gmail.com>
Date: Tue, 03 Nov 2026 19:33:33 +0100
Subject: [PATCH b4 2/4] review: protect draft comments from follow-up
 imports
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Post: <mailto:tools@linux.kernel.org>
List-Help: <mailto:tools+help@linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
List-Owner: <mailto:tools+owner@linux.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261103-view-follow-ups-threaded-v1-2-11c2e2211a9f@gmail.com>
References: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
In-Reply-To: <20261103-view-follow-ups-threaded-v1-0-11c2e2211a9f@gmail.com>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Bernhard Kaindl <bernhardkaindl7@gmail.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793730813; l=3685;
 i=bernhardkaindl7@gmail.com; s=20261024; h=from:subject:message-id;
 bh=AMuuBp/3PFaIeRPtTo0fPFJK7Eue29mvFNZ1cdfm0EE=;
 b=UnKylOlQhWN/J8u4vdOCv5kH+tzihLPHiH3y44DJ0YrJu9HsDfMB0dOp59J3WaJuMWf2MOv/H
 fjqMoLtrhL2DGRkbxnQUSJQh1ukmfdceAbosauJM+KgbELa7OPil/nj
X-Developer-Key: i=bernhardkaindl7@gmail.com; a=ed25519;
 pk=oIjnI/us0Uh5d/WP18V5IQq/FrLPUp+W0JAhJ9QCQIs=

Follow-ups from the current reviewer can contain quoted patch context.
Importing them as an external review can overwrite the reviewer’s draft,
or create a duplicate entry when the address differs only in case.

Skip automatic inline imports from the current reviewer while continuing
to display the follow-up and import other reviewers’ comments.

Signed-off-by: Bernhard Kaindl <bernhardkaindl7@gmail.com>
---
 src/b4/review_tui/_review_app.py |  5 +++++
 src/tests/test_tui_review.py     | 41 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 46 insertions(+)

diff --git a/src/b4/review_tui/_review_app.py b/src/b4/review_tui/_review_app.py
index dfedca4..0e5fc6b 100644
--- a/src/b4/review_tui/_review_app.py
+++ b/src/b4/review_tui/_review_app.py
@@ -2162,6 +2162,11 @@ class ReviewApp(LoreNodeShutdownMixin, CheckRunnerMixin, App[None]):
                 reviewer_email = fc.get('fromemail', '')
                 if not reviewer_email:
                     continue
+                if (
+                    reviewer_email.casefold()
+                    == str(self._usercfg.get('email', '')).casefold()
+                ):
+                    continue
 
                 fc_msgid = fc.get('msgid', '')
                 existing_entry = patch.get('reviews', {}).get(reviewer_email, {})
diff --git a/src/tests/test_tui_review.py b/src/tests/test_tui_review.py
index 21fd2e2..0236cc9 100644
--- a/src/tests/test_tui_review.py
+++ b/src/tests/test_tui_review.py
@@ -374,6 +374,47 @@ class TestFollowupSelection:
             compose.assert_called_once_with(entries[1])
 
 
+class TestFollowupReload:
+    @pytest.mark.parametrize('uppercase', [False, True])
+    def test_inline_import_preserves_own_draft(
+        self, gitdir: str, uppercase: bool
+    ) -> None:
+        branch, _shas = _create_review_branch_with_patches(
+            gitdir, 'followup-own-inline', ['patch 1']
+        )
+        app = ReviewApp(_build_session(gitdir, branch))
+        email_addr = str(app._usercfg['email'])
+        draft = [{'path': 'foo.c', 'line': 1, 'text': 'My unsent draft'}]
+        app._patches[0]['reviews'] = {email_addr: {'comments': draft}}
+        followups = {
+            1: [
+                {
+                    'fromemail': email_addr.upper() if uppercase else email_addr,
+                    'msgid': 'mine@example.com',
+                    'body': '> diff --git a/foo.c b/foo.c\n\nEarlier feedback.',
+                },
+                {
+                    'fromemail': 'other@example.com',
+                    'msgid': 'other@example.com',
+                    'body': '> diff --git a/foo.c b/foo.c\n\nExternal feedback.',
+                },
+            ]
+        }
+        external = [{'path': 'foo.c', 'line': 2, 'text': 'External feedback'}]
+        with (
+            mock.patch(
+                'b4.review._extract_comments_from_quoted_reply', return_value=external
+            ),
+            mock.patch('b4.review._resolve_comment_positions'),
+            mock.patch.object(app, '_save_tracking', return_value=True) as save,
+        ):
+            assert app._integrate_followup_inline(followups) == 1
+        assert app._patches[0]['reviews'][email_addr]['comments'] == draft
+        assert app._patches[0]['reviews']['other@example.com']['comments'] == external
+        assert len(app._patches[0]['reviews']) == 2
+        save.assert_called_once()
+
+
 class TestFollowupTree:
     def test_tree_keeps_orphans_and_breaks_cycles(self, gitdir: str) -> None:
         branch, _shas = _create_review_branch_with_patches(

-- 
2.43.0

