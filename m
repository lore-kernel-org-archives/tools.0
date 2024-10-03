Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8319CCF5
	for <tools@linux.kernel.org>; Thu,  3 Oct 2024 16:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727971304; cv=none; b=d2Je6KXRSFtwjj3lIZ+7vMpXhz+VuLPxqdqu47szWqHUEqewv1ZHshRDsXAv/uu4lnriU2YUIuA1ox+7HUKGiW/xECKNYHRsOyTxNt90pKMXMe8+iODOgBEelOjQR+BsbDRcKgN61IQbBfTupThI8Y27X9wmd5+aUk+QJoQyugk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727971304; c=relaxed/simple;
	bh=mtbxQUrih5ltE+iIO7MLI4iGimkvP6toAGL3Swvmkw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=j2h3Q74o8Psy6wrc7wGl6D31vCKB9QFfMCMLHvQcD7tetEIdhtWVgv44ndLEsXww0+4v+p3+rzetQWOkbhcK/BZ4gR6etxr7PQIuhS8dy0Mo8RzswdBOghEbueRKHV/B3uacigsXCwEOF7ziKMnNy90d+WRwR+qAvZV4IasHOG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Xr24Bkz2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Xr24Bkz2"
Received: by smtp.kernel.org (Postfix)
	id 8DE6DC4CECC; Thu,  3 Oct 2024 16:01:43 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7FB98C4CEC5
	for <tools@kernel.org>; Thu,  3 Oct 2024 16:01:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 7FB98C4CEC5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1727971301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=s0UKj6kPYry6FqhcsS2/qYqzrlZfze44qVONtnklorM=;
	b=Xr24Bkz2O/hzp7G71tg/d3gJh6Z4fY5tBiNfvr+3Krb3cFw/1GDyuVlkSOw1MdbEo3d8Od
	RFsA/JRudoTq+Y6hDXisTxxdZv4fAzZa8+UPJe6KJmTmylc1VlvcGLuwnRTd9KwFIh+hBx
	kqhKZJ5DBefTCWl31AQudI0uI6ffITI=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-n6NjLyxRMk2rJwrZ55P5Zg-1; Thu, 03 Oct 2024 12:01:40 -0400
X-MC-Unique: n6NjLyxRMk2rJwrZ55P5Zg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a8a9094c973so59952966b.2
        for <tools@kernel.org>; Thu, 03 Oct 2024 09:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727971297; x=1728576097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s0UKj6kPYry6FqhcsS2/qYqzrlZfze44qVONtnklorM=;
        b=cqOXl+ImKU+xATBYumx3CnvKYhVytlNFucLpjaunSXmSMCaSHZW+U9vKTkpNGkd4F1
         1r5kwFF2BWlu4M7o95eFgiXF1pjoINqOnM5CJrCLur2lllqR7W7/mwxiox6ZzQslnecN
         Nsh/2Dv9h+Wgg4naCYMt7hioCQTWZTCsnuyFJg8JcqTX5Y86mELpDBmLs8fzL7uts+xf
         9h5PCVADQA8ZR+Njgue1FKsWKSQ37GPntxSdGfuWNkrdR+B+ciE9qEo7FHwTs0SbsAdm
         CZGBOtBdi8hNLxDg/XUzBHYZpRl/lbob35y9kb54sHP8ssFJuuN+opAdovZbGK+IQDvJ
         dbuw==
X-Gm-Message-State: AOJu0YzUlTO0Ezl1JX9sJz5sN8+TmTN0SQlElroRjoZCYSWcGXYhVTGM
	wFfDuqmwQCzSuAR8AfdXw8DFNQeMBxRBEW74eCMFaiP/YwVegFgfV0vL3aq5wbjgWh/fYbDg+h4
	dTvDurjtDy6Bt8KAZSAoCLhl3fswJP9Ov0cwaac7lp6+5wJVUCDcDLiRIo3rYo0i22Izwe4+r04
	pOFBjchh10vTHCjWlLzyvmeZ8WfPrW
X-Received: by 2002:a17:907:3d89:b0:a86:a73e:7ec9 with SMTP id a640c23a62f3a-a98f834bf90mr605306766b.46.1727971297401;
        Thu, 03 Oct 2024 09:01:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoQZ2WIV/+NpZjTdrQfzpxRncoSe/pCCTs6v8wJfnISQkBSit54fQmPyco5+5HcVivlRhtbA==
X-Received: by 2002:a17:907:3d89:b0:a86:a73e:7ec9 with SMTP id a640c23a62f3a-a98f834bf90mr605299566b.46.1727971296534;
        Thu, 03 Oct 2024 09:01:36 -0700 (PDT)
Received: from thinky.redhat.com (ip-217-030-065-002.aim-net.cz. [217.30.65.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a99103bbc0dsm101356266b.118.2024.10.03.09.01.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Oct 2024 09:01:36 -0700 (PDT)
From: Andrey Albershteyn <aalbersh@redhat.com>
To: tools@kernel.org
Cc: konstantin@linuxfoundation.org,
	Andrey Albershteyn <aalbersh@redhat.com>
Subject: [PATCH] b4: handle invalid timezone value
Date: Thu,  3 Oct 2024 18:00:22 +0200
Message-ID: <20241003160021.1786695-2-aalbersh@redhat.com>
X-Mailer: git-send-email 2.44.1
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

If timezone value in "Date:" field is invalid (out of -24h..24h
range) then b4 fails with following error:

  ...

  File "/nix/store/7sz8qnm7csfyxfj2k8v8p8w3ar5h0b13-b4-0.13.0/lib/python3.11/site-packages/b4/__init__.py", line 1239, in __init__
    self.date = email.utils.parsedate_to_datetime(str(msgdate))
                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/nix/store/h723hb9m43lybmvfxkk6n7j4v664qy7b-python3-3.11.9/lib/python3.11/email/utils.py", line 205, in parsedate_to_datetime
    tzinfo=datetime.timezone(datetime.timedelta(seconds=tz)))
           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
ValueError: offset must be a timedelta strictly between -timedelta(hours=24) and timedelta(hours=24), not datetime.timedelta(days=4, seconds=10800).

For example, this patchset will fail due to +9900 timezone which is
4days 3hours:
https://lore.kernel.org/all/170405029862.1826032.9120032235595084513.stgit@frogsfrogsfrogs/

Fix this by checking if timezone is in valid range.

Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>
---
 src/b4/__init__.py | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 811bbcaf028d..2555d205966b 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -1245,7 +1245,12 @@ class LoreMessage:
 
         msgdate = self.msg.get('Date')
         if msgdate:
-            self.date = email.utils.parsedate_to_datetime(str(msgdate))
+            dtuple = email.utils.parsedate_tz(str(msgdate))
+            # Invalid timezone (e.g. -9900)
+            if abs(dtuple[-1]) > 86400:
+                self.date = datetime.datetime(*dtuple[:6])
+            else:
+                self.date = email.utils.parsedate_to_datetime(str(msgdate))
         else:
             # An email without a Date: field?
             self.date = datetime.datetime.now()
-- 
2.44.1

