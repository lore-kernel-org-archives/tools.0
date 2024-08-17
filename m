Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1D43A1B0
	for <tools@linux.kernel.org>; Sat, 17 Aug 2024 08:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723881686; cv=none; b=n/vG08rV7ik4lVc+SHbXTGy9p5P7vMIKoG6yPVrHSk95Yn7eaW1VgYqXArsYrQDT6k7pMbi5DA0S2EaIcNmTYqe2l8ocvoIOVB6hPlrhg1sSw+g+6l2ec4d7zQQzHLCILrz52+uAbvQuxVkRV9wHLgfvL708BE4oWwgZhnGdhik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723881686; c=relaxed/simple;
	bh=xwKeLr0hN7LgKCKt1+YB2W2CnS0BMCvOj7+EA8IgZjw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=t/dPi1+/2BeO+akcT4EuzH9i/Hfa26CouQ5I92/DhZrT5ahxYNGGripRE4DpP2C2mOlwPYw1sIMDye8H5sz4rcLmo8Eqy6oIGuTbR7RJ8eJ3SabVYTm/JolLlWiM8zD6zgkHfNIg73DwWKatJ0cx81VYIMf7ijQnnMfGQT3RebQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C+MIsJ8E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C+MIsJ8E"
Received: by smtp.kernel.org (Postfix)
	id 66EA5C4AF0D; Sat, 17 Aug 2024 08:01:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 50CD9C116B1;
	Sat, 17 Aug 2024 08:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723881686;
	bh=xwKeLr0hN7LgKCKt1+YB2W2CnS0BMCvOj7+EA8IgZjw=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=C+MIsJ8EU1VixJzKMUPOwzN5/nzCRLvMPx7mU4VtjJ9/UESGN8JXagGxmXS8VxXx5
	 BkXNZ3h4ShotWidmv51QTvYbXvStZEDmMHmStGx23z0JJf24OVSElapRAxwuvs6GdF
	 cIvkWeEIq6A/1oor/pXxov3nEzJeQPIhlqmUIIJZEIxEuInLnm4HDcTWyKLH0Lf8WA
	 2reiYGg8TzlIX2yDfA4ecY8AQaT+cQKzbpv1dvD544Kh5m8BwbRKUB+lqDu7FK40w3
	 TfdSHMU4zdeRUZp2+VrDJZVDjKYNgW5m/EYn2ZmeHxpJ3OqhYZIz8QyvsBNkQ6xYkL
	 zg4fIyYPfi8WQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38912C52D7F;
	Sat, 17 Aug 2024 08:01:26 +0000 (UTC)
From: =?utf-8?q?Duje_Mihanovi=C4=87_via_B4_Relay?= <devnull+duje.mihanovic.skole.hr@kernel.org>
Date: Sat, 17 Aug 2024 10:00:53 +0200
Subject: [PATCH b4] Document patatt key selector
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240817-selector-doc-v1-1-7c5c824a4e9d@skole.hr>
X-B4-Tracking: v=1; b=H4sIALVYwGYC/x3MQQqAIBBA0avErBNUjLSrRIvSsQZCQyMC8e5Jy
 7f4v0DGRJhh6gokfChTDA2i78Aea9iRkWsGyaXiWows44n2jom5aBkqboRWRg5eQ0uuhJ7efzf
 DpmCp9QNRSBWzYgAAAA==
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1791;
 i=duje.mihanovic@skole.hr; s=20240706; h=from:subject:message-id;
 bh=1wfqlisqcIHFWOChgds5FzvapQFDMUC8CZXJftubi1c=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDGkHInZdv1LU1p2n/SX0yuF21lBG1g3KjouWMFiuPvGwX
 rncuv9BRykLgxgXg6yYIkvuf8drvJ9Ftm7PXmYAM4eVCWQIAxenAEykp5Phv5vDyRvvZ/40/vtB
 TSTx/rY9K79FGX9cxHtdTSisL0f5uj0jw+NfftyfhOKCvYWPvfupX2QvPLdhZ9waxvBN15aduLZ
 YnwMA
X-Developer-Key: i=duje.mihanovic@skole.hr; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03
X-Endpoint-Received: by B4 Relay for duje.mihanovic@skole.hr/20240706 with
 auth_id=191
X-Original-From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>
Reply-To: duje.mihanovic@skole.hr

From: Duje Mihanović <duje.mihanovic@skole.hr>

This selector can be used to authorize multiple keys for one email
address, but hasn't been documented anywhere as far as I can tell.

Link: https://lore.kernel.org/all/20240729-macaque-of-inspiring-recreation-9e5c4b@lemur/
Signed-off-by: Duje Mihanović <duje.mihanovic@skole.hr>
---
 docs/contributor/send.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/docs/contributor/send.rst b/docs/contributor/send.rst
index a597ac5..54ed474 100644
--- a/docs/contributor/send.rst
+++ b/docs/contributor/send.rst
@@ -122,6 +122,23 @@ from the message::
 
 You should now be able to send patches via this web submission endpoint.
 
+Changing your attestation key
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+If you change your attestation key without changing your email address (e.g.
+switch from a ``patatt`` generated key to a PGP key or change your PGP keys),
+your previous authorization will stop working. Trying to reauthorize will also
+result in an error as changing the attestation key is `currently unsupported
+<https://lore.kernel.org/tools/4608818.LvFx2qVVIh@radijator/T/#m9aa19999463864341ed8be929f470e5439513256>`_.
+Instead, you can change the key selector to something other than ``default``
+with the following setting::
+
+    [patatt]
+       selector = something
+
+.. note::
+   The selector can be anything besides default or any previously used selector.
+   For example, you could use the creation date of your PGP key.
+
 Using your own SMTP server
 --------------------------
 If there is a ``sendmail`` section in your git configuration, B4 tries

---
base-commit: 37811c93f50e70f325e45107a9a20ffc69f2f6dc
change-id: 20240817-selector-doc-e409184925f8

Best regards,
-- 
Duje Mihanović <duje.mihanovic@skole.hr>


