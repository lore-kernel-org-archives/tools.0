Received: from mx1.riseup.net (mx1.riseup.net [198.252.153.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F74E29AC
	for <tools@linux.kernel.org>; Sun, 14 Aug 2022 22:05:23 +0000 (UTC)
Received: from mx0.riseup.net (mx0-pn.riseup.net [10.0.1.42])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mx0.riseup.net", Issuer "R3" (not verified))
	by mx1.riseup.net (Postfix) with ESMTPS id 4M5WTV22R3zDqBX
	for <tools@linux.kernel.org>; Sun, 14 Aug 2022 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1660514206; bh=w8Xf4rwc/5+ZL81d9STRMhqzjJFeu/tKOQ61A1Q5yA4=;
	h=From:To:Cc:Subject:Date:From;
	b=I697jnzd7JwxKSZQ+Sat4O7EU0rULZX8D47KEsgMHQxl5RuDAxdbLZISe6WjEXyMA
	 Cm0j6+8ODTrGMUrorMuGn9hS5pCfFlbR6cpH9/qdj1jkXckCbJ6Y8nu9PbqfuOep3i
	 zG6XyQo+f0ItYK0980Vlvm4AcWMap2JBfy5776cc=
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.riseup.net", Issuer "R3" (not verified))
	by mx0.riseup.net (Postfix) with ESMTPS id 4M5WTN5Y3vz9sQY;
	Sun, 14 Aug 2022 21:56:40 +0000 (UTC)
X-Riseup-User-ID: 1734643F7E85C007366BCB45B23C26D09C9510432857B48B0C0EA748568708D4
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews1.riseup.net (Postfix) with ESMTPSA id 4M5WTM1fGXz5vW0;
	Sun, 14 Aug 2022 21:56:38 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: tools@linux.kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
Subject: [PATCH b4] Add dnf package on the Installing section
Date: Sun, 14 Aug 2022 18:56:24 -0300
Message-Id: <20220814215624.89760-1-mairacanal@riseup.net>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

b4 is provided by Fedora Linux repositories through the package
python3-b4 [1]. That said, add dnf package installation method
on the README for Fedora-based systems.

[1] https://src.fedoraproject.org/rpms/python-b4

Signed-off-by: Maíra Canal <mairacanal@riseup.net>
---
 README.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/README.rst b/README.rst
index ca4718c..ebbe195 100644
--- a/README.rst
+++ b/README.rst
@@ -16,6 +16,10 @@ To install from pypi::
 
     python3 -m pip install --user b4
 
+On Fedora-based systems, you can also install it from dnf::
+
+    dnf install python3-b4
+
 Upgrading
 ---------
 If you previously installed from pypi::
-- 
2.37.1

