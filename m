Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D73D1859
	for <tools@linux.kernel.org>; Sun,  8 Jan 2023 21:31:11 +0000 (UTC)
From: Thomas =?utf-8?q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=t-8ch.de; s=mail;
	t=1673213068; bh=miUe0sWONpgpAKbfOd/iEY1ydfkfhWvA/Y18a3/JuQk=;
	h=From:Date:Subject:To:Cc:From;
	b=mHaC0/kamxvoKW2lCFGsUgdzmGj2K3r9lz9nBbs4Vyhi4imliOrtB6C6GM1m/ln/1
	 b4Jc9uv5nmC4Bi2UPnZ7uOcCdUFKl6x3DuDVXZviF0J39EjIShvhIgNwkx8SH4mQx1
	 Iuf4ArSRq5kD9q+v/cDMA1t557rHsCwlPRTQJPgc=
Date: Sun, 08 Jan 2023 21:24:20 +0000
Subject: [PATCH b4] tests: explicitly clone master branch from git bundle
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Message-Id: <20230108-tests-default-branch-v1-1-58000cfdf024@t-8ch.de>
X-B4-Tracking: v=1; b=H4sIAIQ0u2MC/y2NQQqDMBBFryKzdiCaUEuvUlwkOqkDIS2ZKIJ4d
 wfp8r3P4x8gVJgEXs0BhTYW/maFrm1gWnz+EPKsDL3prenMEytJFZwp+jVVDMXnacHBxMHFh7Vk
 HWgavNB/0zivKan8FYq8319vCA7G87wA3K8NIH8AAAA=
To: "Kernel.org Tools" <tools@linux.kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
 Thomas =?utf-8?q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
X-Mailer: b4 0.12-dev-7251b
X-Developer-Signature: v=1; a=ed25519-sha256; t=1673213065; l=1116;
 i=thomas@t-8ch.de; s=20221212; h=from:subject:message-id;
 bh=miUe0sWONpgpAKbfOd/iEY1ydfkfhWvA/Y18a3/JuQk=;
 b=DDUbQwfVVWbQUrMBVwy7DCGD4dNEuT3dpmGEder4dHNVuj5AQJpb6rrjM36xy4lDmaGILWMf+ISB
 1S2V0IOvDpUnFta4zKmGnstwWQbBfilz4k7lCIHe0CiTu3XZIwy5
X-Developer-Key: i=thomas@t-8ch.de; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

If not specified git tries to use the local default branch when cloning
from a bundle.
If the configuration "init.defaultBranch" is not "master" then the clone
from the bundle will not actually clone anything, breaking all the
tests.

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 tests/conftest.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/conftest.py b/tests/conftest.py
index d8338cc4c408..8b0a8f7b5794 100644
--- a/tests/conftest.py
+++ b/tests/conftest.py
@@ -38,7 +38,7 @@ def gitdir(request, tmp_path):
         bfile = os.path.join(sampledir, 'gitdir.bundle')
     assert os.path.exists(bfile)
     dest = os.path.join(tmp_path, 'repo')
-    args = ['clone', bfile, dest]
+    args = ['clone', '--branch', 'master', bfile, dest]
     out, logstr = b4.git_run_command(None, args)
     assert out == 0
     b4.git_set_config(dest, 'user.name', b4.USER_CONFIG['name'])

---
base-commit: a055dede8ca9606b7fb4242816fb68054515e047
change-id: 20230108-tests-default-branch-70f74f633e34

Best regards,
-- 
Thomas Weißschuh <thomas@t-8ch.de>
