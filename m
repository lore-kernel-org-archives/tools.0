Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2783442DA4D
	for <tools@linux.kernel.org>; Thu, 23 Jul 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784799857; cv=pass; b=T1jrj+VRsNstELjZp1IaAWkqdrUPHpck2zj9iqGsKQfS5SHWHcklrCGHxi8SmmRApoZV61d7uQGpNwlfIIfiM2MO/yx4o7KeUmznPJNS5uUu3rcCTf4vRBGtz/tJyU+6rN9SqGgigUMqNujrqW48tGScs65RXiEj5G/yTyUw9a0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784799857; c=relaxed/simple;
	bh=EyJtqmba9L7yn0QtMoc57AhELs35yij97qo9R7AgtoY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IogZNiH+iOvhnO3DU6KJl7C8lRtO+5Al0tC8jlTdTXRIyF7T3o0lbORz5yINkqQubyLVXjhxD+laNwIXKfp40p0gInJfEZ2NyC+/knTpjOwrHXlAIrV/aNKpmANoqSLwnzBirl8pQm8UsAlacDIsfz4Y6rr/xVy/vhGrDbGIbhw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; arc=pass smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix)
	id 6A9871F00A3A; Thu, 23 Jul 2026 09:44:13 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=212.42.244.119
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1784799853;
	b=q+KvVRXVD/0yxo0EDwlYZrK2/N/cLAOBigziMfHFzAZj7OvYGkEjll+EfuINp+azhtw3
	 v2TbWjXgjaT68ptNK6BCFbHTU1rxD9ctkwfgrimdrcsLDrbfvDEq0ptGOI5yMTAst+Qe0
	 4nzJGFSbH0r/IrQ32ChFicLTcEZOGaPiPmwf/3dl9sk6m+4C56HQTbDRl8FUUGFSaRetg
	 9Tdbgfx5e9wM0/GCsF9WJQyD76PMWCgpIQO3HKRXBnxg4m0mAEFWxyVw8281Pqhmqs7+D
	 TKWxwrrrKhEFs+FWrhXDuFm2F20J2za1+lU3j92NfuN15OVI2pboxhcZKxRNG5hd1/w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1784799853;
	h=DMARC-Filter:Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Developer-Signature:X-Developer-Key:X-purgate-ID:
	 X-purgate-type:X-purgate-size:X-purgate:X-purgate:X-pfmilter;
	bh=8zrUNe+WsAfzdti5UldirpS3+Vvd1W0PsbMPMU9OsDY=;
	b=VPHkKoiFRwuw6G923A6SX4DFMTvehw7x6V+dbLWob9mjINspAzkPprXdddGViyyZcOH7
	 d7mUaymhyuKiVDfOXeYF+afafY4y5yxTcQrb7ifmSJ+7DTIxQOiGq2zZaHcA0m48eAMd/
	 0N8A8NIhfU5cOjsGRCFX/i/de3OlN50onvh2uZUNdseIOb5moy2/nMIhDfs5Akx9M3Zp2
	 Hgv7ttp90oG/U97vbf64VmYMKBEyZtDxiZ1zRlk8yVb8DbnJCmB0F/kr/wwyOE0DWytVF
	 AMlu4ABOgpnt2y2JEqYWhiBMTvBTuMxE8EOxYoiPm6AAiJNLBq99ntqHQETVZ9Hpl0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; dmarc=pass header.from=fritz.com;
	spf=pass smtp.mailfrom=fritz.com;
	arc=none smtp.remote-ip=212.42.244.119
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 21D9B1F000E9
	for <tools@kernel.org>; Thu, 23 Jul 2026 09:44:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org 21D9B1F000E9
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=fritz.com
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.57.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a61e263-8d78-7f0000032729-7f000001cbe0-1
	for <multiple-recipients>; Thu, 23 Jul 2026 11:44:03 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Thu, 23 Jul 2026 11:44:03 +0200 (CEST)
From: Nicolas Schier <n.schier@fritz.com>
Date: Thu, 23 Jul 2026 11:43:59 +0200
Subject: [PATCH B4] Show name of module that causes import error
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-show-name-of-module-that-causes-import-error-v1-1-d3c0d71834e2@fritz.com>
X-B4-Tracking: v=1; b=H4sIAF7iYWoC/yWNQQ7CIBAAv9Ls2U1KrcR49BvGA6WLYASaXVCTp
 n8X9ThzmFlBiAMJnLoVmJ5BQk4N1K4D6026EYa5MQz9oHutFIrPL0wmEmaHMc/1QVi8KWhNFRI
 McclckJgz42CPI5mD0/vJQUsuTC68f7sLnEe4/p3U6U62fD+wbR+CeB5zlAAAAA==
X-Change-ID: 20260611-show-name-of-module-that-causes-import-error-2c84ea5f63bf
To: tools@kernel.org
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Nicolas Schier <n.schier@fritz.com>
X-Developer-Signature: v=1; a=openpgp-sha256; l=2044; i=n.schier@fritz.com;
 h=from:subject:message-id; bh=EyJtqmba9L7yn0QtMoc57AhELs35yij97qo9R7AgtoY=;
 b=owEBbQKS/ZANAwAIAYjGvJyImm24AcsmYgBqYeJik5CDPmsxot9tuvzpoF1POyCSNMZgVPDJH
 gY+7WKvMvCJAjMEAAEIAB0WIQQO/4WJ63TpgecLpGmIxryciJptuAUCamHiYgAKCRCIxryciJpt
 uGQ5D/92KoSAPn5bUszOCh1PtR3VCMeWbFl9xmHJdgts8fOkFg+Ov0ZZcTqUYJr1rYJ++d98A32
 QpLenHXsM1IKh1CGZ0VmPh4NiR8YKoyXdqXWLyNfG85i7dmPPJEL6KwYc2PLx7mcktAi8mJ9UKD
 2MD/3xgAp9b+GPAUaFnPeUBUllx477k3mJa9tzryCwdcDCQLKAdnSAv6z+bPeUAtm/uxexMdTji
 T16nXsYYD6KjZbjpwPf+xpkYSxNQ45zyLeEDGa/VlooRoHoLWFTtmknKjksSvW9m9uWfaL7KYqu
 KxXTbEBwgZebgYjqWkC7gebcyhrH6mimhKPKEjGmQwhs2CoFECgLH3vGKk55UlycvmO0ozQgYGH
 fYzGxxlnQA1AiJ9UipkSgoSdO6zUqoBLGTvhj06lCNKRdCNbcXQfVwsezy+ngnp+3JdsZ5uFaUD
 geTXLeVnlVUwF2b5vBrhMpuXElH8sh5PzoWyaEQ1qNnRnLYPnKjJ4S6Qm2/XXpva7Lo9rvX5LU3
 Ri4dnaJQv31FIXsOub7lCnhuJ/z3el+nDReLyWKSD4qxApvLVE01lb7tS1J2tboTfw6eJil+7FP
 MVAoTnXc5UJwvk18Ubjzb4BM6dKPDPaGJyVqGRZvaa4Tu2dQ/cvz3yAHQvb3LAHRfGBBYseT8We
 lPZ7cNljplis/Qw==
X-Developer-Key: i=n.schier@fritz.com; a=openpgp;
 fpr=7CF67EF8868721AFE53D73FDBDE3A6CC4E333CC8
X-purgate-ID: 149429::1784799843-B3534060-E9EDE509/0/0
X-purgate-type: clean
X-purgate-size: 2046
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-pfmilter: queueID: 541D3A05A4

Update the error message for import errors to show the name of the Python
module or library that is missing effectively.

Running 'b4 review tui' on a system that has the Python textual library
installed but misses pygit2, results in

    The TUI requires the textual library.
    Install it with: pip install b4[tui]

Showing the correct name contained in the ImportError instead of
'textual' may help in such cases.

Signed-off-by: Nicolas Schier <n.schier@fritz.com>
---
 src/b4/bugs/__init__.py  | 4 ++--
 src/b4/review/_review.py | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/src/b4/bugs/__init__.py b/src/b4/bugs/__init__.py
index 1cd2db42756d..24f0f6364e35 100644
--- a/src/b4/bugs/__init__.py
+++ b/src/b4/bugs/__init__.py
@@ -201,8 +201,8 @@ def cmd_tui(cmdargs: argparse.Namespace) -> None:
     """Launch the bug management TUI."""
     try:
         from b4.bugs._tui import BugListApp
-    except ImportError:
-        logger.critical('The TUI requires the textual library.')
+    except ImportError as e:
+        logger.critical(f'The TUI requires the {e.name} library.')
         logger.critical('Install it with: pip install b4[tui]')
         sys.exit(1)
 
diff --git a/src/b4/review/_review.py b/src/b4/review/_review.py
index a3d82acc186c..a14d7afbb05c 100644
--- a/src/b4/review/_review.py
+++ b/src/b4/review/_review.py
@@ -2444,8 +2444,8 @@ def update_series_tracking(
 def cmd_tui(cmdargs: argparse.Namespace) -> None:
     try:
         from b4.review_tui._entry import run_tracking_tui
-    except ImportError:
-        logger.critical('The TUI requires the textual library.')
+    except ImportError as e:
+        logger.critical(f'The TUI requires the {e.name} library.')
         logger.critical('Install it with: pip install b4[tui]')
         sys.exit(1)
 

---
base-commit: 0e65f947e4f98a3c48a47f280a86dd23845259b0
change-id: 20260611-show-name-of-module-that-causes-import-error-2c84ea5f63bf

Best regards,
--  
Nicolas Schier

