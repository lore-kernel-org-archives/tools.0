Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3E6EBE
	for <tools@linux.kernel.org>; Fri, 10 Mar 2023 06:05:55 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PXwXK5RgKz4x5Q;
	Fri, 10 Mar 2023 17:05:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678428353;
	bh=ZsjrKZ4mzw6rQ7yW/f9gbALRjKuBEi9YfcrYu+qgu3U=;
	h=From:To:Subject:Date:From;
	b=RBBJbxzbB7sWbq3Fjdu3lsOzNp9JXzWGH3tpuwkWXkdDVZ0MTJsQZxp9TUFndNCPz
	 H44ZWrkwsJz/y9bDl4az+yqOS4kSd16KseVEd8S3OOOBCBghwcjuuka9LJdZxZcxls
	 hBtcWfVNcv1G5IlG+oqHJW3klEHy10DGb4bmV3yEsQ4b8Pq0zj5AcKdvNHDTIR2sCf
	 i2R2OAyORGKrrPLDLBYkP3BIo5eLDqixXH3EkfUB/cyi0kVEuAC0LtGStnx4bJRVF+
	 2l9lnsd0gfZnvbY1+b3qAF+oPEtA1wGDcecqwtfq3io/Miv17i9xMQN91NEAkwuSHO
	 worQ1ePXyDVjg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: tools@linux.kernel.org
Subject: [PATCH] docs: Document thanks-treename
Date: Fri, 10 Mar 2023 17:05:52 +1100
Message-Id: <20230310060552.1611274-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 docs/config.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/docs/config.rst b/docs/config.rst
index c43f32d..242802d 100644
--- a/docs/config.rst
+++ b/docs/config.rst
@@ -271,6 +271,11 @@ These settings control the behaviour of ``b4 ty`` command.
 
   Default: ``None`` - falls back to user email.
 
+``b4.thanks-treename``
+  Name of the tree which can be used in thanks templates.
+
+  Default: ``None``
+
 ``b4.email-exclude`` (v0.9+)
   A comma-separated list of shell-style globbing patterns with addresses
   that should always be excluded from the recipient list.
-- 
2.39.2

