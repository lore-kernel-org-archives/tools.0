Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE71A2AD2E
	for <tools@linux.kernel.org>; Tue, 21 Jul 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784619733; cv=pass; b=or2lxETo8qGwjLOEbBj6o09q4uE/jm51YC/PS6yO5mp5c2VewQ1lloj4eLT3ceHCNFKzY1mdB5crvPNERasLc8TvQr6XV++RhZwfsVhSQ1eExSB1YYQsDfAv7wH9+IYpWyhtTX5D5ZiLZl3KqmUXkmqczRTjD20xoXrHpFey0N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784619733; c=relaxed/simple;
	bh=qHwLheAvzPGw6QmHsfV44h3VX0SJAXe7znWwH4p97t4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To:Cc:Content-Type; b=mpp7VEf/vzu/yqgqywQc6yljOlF/Xe1ufX0Qra0fukrHE5dmlYhOHY0yXQoJw1ZSzm/y8BLPSiXgwLw9Kx1RA2PtQxOP6R63/a17ZfsXvXJgtvLXd/CEaz2eANPy+hR+Yw4e+C0H+s9u60cuOHbltI8MVFBe27Z8NcSZsvRzdB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IVdu3wab; arc=pass smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IVdu3wab"
Received: by smtp.kernel.org (Postfix)
	id 9CAB11F00A3A; Tue, 21 Jul 2026 07:42:11 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784619731;
	b=aXIlscM/BY6eeQ4LsFenRBWngWil2dTdvzPHTp2C+pgdyUtItIqPq0sy03We/w7SBf3I
	 Sf1V5J/E0Xd37K5lFLFhDWCcZSAz7bBkZWYm5BGHUnrQ3CQSkIHoiLXlLIDGkJhFRJ5+L
	 i1q9fAgKK58juck7/sDj287lbKW6re8/uUHpeuoNg6QdFnHz5xDtLCnQak58PYbRJTnfc
	 Qmn2Y016f3iAY4gWnU5+O0phRIFp3mZl4Xc0Up2/E18IZbCk9/3VxLnbhn6eaqS8XEA2q
	 qc8Qacm+mX/nHnP12E5N0abUBEXePocTmMnTyGOg0lhGokQfjeWrOY+h38fpiTURx9w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784619731;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:Received:From:Date:Subject:
	 MIME-Version:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Developer-Signature:X-Developer-Key:X-Scanned-By:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Transfer-Encoding;
	bh=xAt7f/69chuG0QRu5f3UQ13bJ5Pws1QZkAOx6wtKNeQ=;
	b=qYNOoofBATG+Abp1uIoW9Jbr2P4u59Ph9/PqbVTAyCSdu4qIVLNcpEA+W8kLcJx+qo7l
	 2hQu+yQO5hWXW5kaeK38A+fJKg3m60Bvj+m+21usWy2OwvY6JT0mmLYAfiztixzS9+Yz1
	 jGor4tYJRjR1FcFhmsDr1YjeuMEf+fMgB3e0muKvV5CmRHtTFOtuFp1oHXFNygsnMqlNN
	 DR0NiFXxOtqN+jwr+e1xDNYPr5R7OokkSGp9W41WneDGa4XJ2jJeBVYRXrYTp4HzDarlc
	 7tTMDgvztJRA0kMHpG/I7oYSrv2InrTx9fxwVlwFvVq+v8kjO7bMlwp78YEKLE8uTow==
ARC-Authentication-Results: i=1; smtp.kernel.org; dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVdu3wab;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BC0441F000E9
	for <tools@kernel.org>; Tue, 21 Jul 2026 07:42:10 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IVdu3wab
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org BC0441F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784619729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xAt7f/69chuG0QRu5f3UQ13bJ5Pws1QZkAOx6wtKNeQ=;
	b=IVdu3wabZso3gIN3LX+tNVLqmPo20S6egMd27vb31KlsuARLgyUdKE0c/s3TTDlZDUR2+F
	fMYUEX7gY5aU2HlOZWaV4a5AMG6oNaqnrRvSTqbRToymP3c4hPUyZjXotSwx3D9nY3AIya
	BocnCNnvM+LkFDMlzdB2BZtCPkPw30Y=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-wOyjDvARMN-95srmNjOTXw-1; Tue,
 21 Jul 2026 03:42:06 -0400
X-MC-Unique: wOyjDvARMN-95srmNjOTXw-1
X-Mimecast-MFC-AGG-ID: wOyjDvARMN-95srmNjOTXw_1784619725
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E02DB180895D;
	Tue, 21 Jul 2026 07:42:04 +0000 (UTC)
Received: from localhost (unknown [10.44.22.17])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B0D34300418D;
	Tue, 21 Jul 2026 07:42:03 +0000 (UTC)
From: =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
Date: Tue, 21 Jul 2026 11:41:51 +0400
Subject: [PATCH liblore] utils: extract message-ID before clean_header to
 fix Gnus In-Reply-To
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Message-Id: <20260721-fix-gnus-in-reply-to-v1-1-630a4ea4f696@redhat.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQqDQAxFryJZNzAzSou9SumiarQpw4wkWhTx7
 sZ2+fjvvw2UhEnhXmwg9GXlnAz8pYD2/UoDIXfGEFy4ulvw2POCQ5oVOaHQGFecMrq+8nXly9o
 0sOsoZN4v+4DITcxC8PwPOjcfaqczCvt+AH/DwwWBAAAA
X-Change-ID: 20260721-fix-gnus-in-reply-to-0f4194139202
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Claude Opus 4.6" <noreply@anthropic.com>, 
 =?utf-8?q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2803;
 i=marcandre.lureau@redhat.com; h=from:subject:message-id;
 bh=qHwLheAvzPGw6QmHsfV44h3VX0SJAXe7znWwH4p97t4=;
 b=owEBbQKS/ZANAwAKAdro4Ql1lpzlAcsmYgBqXyLHC/rXAgkhv3YB2WaZdsLzNTbaSifV/l++/
 Zmc7AtMo/uJAjMEAAEKAB0WIQSHqb2TP4fGBtJ29i3a6OEJdZac5QUCal8ixwAKCRDa6OEJdZac
 5SqeEACubUVALAcNHPogD74vjk5ugaDBq+7YJTzX73QnDx2jRots4FtsNRjZRpvxwmVXJtbQtGW
 Sv/b9N/Y/xwKA9KX0CxDwVYm3LEJFWJSJuZv0Qfj1kD9S/9oRYZtkfjz2+cwW1XMDZ46nATDmgr
 fxhyN8APSqc/3dC2+GbsyjKjf1HHWbasYlwM3MK+f0defMzvlLvGxggLCDaPZsFxwgdoLRGLSeX
 PROne5adOf5v6ZmkG1hRGz62/N0c3+LidhjM+0uBDWuJ6V/BcPvtnsdluz6Z7WpqGhKwC6HQscZ
 pSx9z9zAFuN8/8P4gZ40aSVpkRana+MC8LMSRJnAmDZK4+pVPIP5kIG+iEIZ7p/jTNkgl3s0QgQ
 rPqKPU88MZE8Jt4oZsgX5MCW1GFJafdYUUPBs0OJz/cadW03uLsH6k7LicWeLUFqdw4FWEACFNS
 iBQZo61OUzMDGgui1NswXMzN7AJEDw2kZG3MPBtQFmYZTcAqGNNLMECPl++8nqPu2vEvsDypbVM
 erqqq3CmYPrbnsgGm0I7NsUO+d0yxvjrB71oSqPTs7yucazjcRDmvjVvgSoshPOQ992p3EldZcE
 rglB0jOfmcDHiBvDkwwP6XmhJcR6VjO+k5olR4lK9zSBE+3MSq80hNGCg3EDejBu6+f95wXWCk9
 2sjT5Rr3GB63uGA==
X-Developer-Key: i=marcandre.lureau@redhat.com; a=openpgp;
 fpr=87A9BD933F87C606D276F62DDAE8E10975969CE5
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lv8bb-uZ7L3Vq6k7OqBPz7jvDsF-eZQMsoDgstL7Sr4_1784619725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

When an In-Reply-To header contains both a message-ID and RFC 2047
encoded words (as produced by Gnus), clean_header() would enter the
email-address parsing path and destroy the message-ID.  This caused
get_clean_msgid() to return None for the In-Reply-To header, making
the follow-up trailer logic fall back to References and pick the
cover letter as parent, which then broadcast the trailer to all
patches via add_cover_trailers().

tests: add test for get_clean_msgid with Gnus-style In-Reply-To

Co-Authored-By: Claude Opus 4.6 <noreply@anthropic.com>
---
Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 src/liblore/utils.py  |  8 +++++++-
 tests/test_message.py | 10 ++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/src/liblore/utils.py b/src/liblore/utils.py
index 04823bf..73be4d6 100644
--- a/src/liblore/utils.py
+++ b/src/liblore/utils.py
@@ -82,7 +82,13 @@ def get_clean_msgid(msg: EmailMessage, header: str = 'Message-Id') -> str | None
     """Extract a clean message ID (without angle brackets) from a header."""
     raw = msg.get(header)
     if raw:
-        matches = re.search(r'<([^>]+)>', clean_header(raw))
+        # Try the raw value first — message-IDs are always in angle brackets
+        # and never need RFC 2047 decoding.  Passing through clean_header()
+        # can destroy the value when the header also contains encoded words
+        # (e.g. Gnus-style In-Reply-To with a display-name comment).
+        matches = re.search(r'<([^>]+)>', raw)
+        if not matches:
+            matches = re.search(r'<([^>]+)>', clean_header(raw))
         if matches:
             return matches.groups()[0]
     return None
diff --git a/tests/test_message.py b/tests/test_message.py
index 77c4cd4..6d3aa84 100644
--- a/tests/test_message.py
+++ b/tests/test_message.py
@@ -50,6 +50,16 @@ class TestGetCleanMsgid:
         msg = make_msg(in_reply_to='parent@example.com')
         assert get_clean_msgid(msg, 'In-Reply-To') == 'parent@example.com'
 
+    def test_in_reply_to_with_encoded_comment(self) -> None:
+        """Gnus adds an RFC 2047 encoded comment after the message-ID."""
+        msg = EmailMessage()
+        msg['In-Reply-To'] = (
+            '<patch-v1-1-abc123@example.com>'
+            ' (=?utf-8?Q?=22Marc-Andr=C3=A9?= Lureau"\'s'
+            ' message of "Mon, 20 Jul 2026 11:55:30 +0400")'
+        )
+        assert get_clean_msgid(msg, 'In-Reply-To') == 'patch-v1-1-abc123@example.com'
+
 
 class TestParseMessage:
     def test_roundtrip(self) -> None:

---
base-commit: a20d90228c111908d1af6f7de583bfcf9197c0ad
change-id: 20260721-fix-gnus-in-reply-to-0f4194139202

Best regards,
--  
Marc-André Lureau <marcandre.lureau@redhat.com>

