Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DABC3BB131
	for <tools@linux.kernel.org>; Wed, 13 May 2026 21:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778707851; cv=none; b=DqrZZ/cC5GmMaDqFxHoBN3aAEU3NQLC/slzX0jw6ibJKjrzM3Efpz/TdaOddMqHJo6PB8JvZgmTg4mrEKyBVnrbg8Z3bPBkhtgZ/r9XHPVxOqIskMPiYjb80BVR0sRyM7ugjWFp5JckH+FgUUcwEhNr6d+QmsjKpCLHI6Evu+v4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778707851; c=relaxed/simple;
	bh=pacAnnuPLs1nl++6ZJsG1xBrFxAfG6f6IWSnpWXqg/o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hajbLMGpf6B0sKBfDUmzW3zfRgD6k5JtCv75U1GQBbns/xhnROGEAOXBuAeM/b9gP0RU6FtVX2z9HaAb1p87u2KULQ6HTxPM9N235ny3VsIiP4xlg1hrLAvha49Zf4VprjPPvCQLoSJEGXyhEEQ3v9Vz3ycvPQFWHE7XHgRLSMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OPk8ioZg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OPk8ioZg"
Received: by smtp.kernel.org (Postfix)
	id C6FABC2BCB8; Wed, 13 May 2026 21:30:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 8E320C2BCC6
	for <tools@kernel.org>; Wed, 13 May 2026 21:30:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 8E320C2BCC6
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778707850; x=1810243850;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:to:cc;
  bh=pacAnnuPLs1nl++6ZJsG1xBrFxAfG6f6IWSnpWXqg/o=;
  b=OPk8ioZgPwWoN8VxzEaYtrcKW/X20veKAKy+RPFLu7pJtFJEvpG5XmZn
   YB38Yn9+TJscpMt1sASy3K8VRAlxzrFRxlKCYYN4MwgA982x5Uy18Gbmh
   smcMXxV/M/0OJVhPI2Zp0hF6Xq4e9OrTQAKoYIilyoi6MKq8Who8EqdPd
   2LJ63Rvf50/Ex4MCt7ZNDb6SKhraBeIdsFWzWy8LBbha+pyG2AcurMoX7
   jy20DpoyCphNz5T8E3FiTSyg0stJo9F1Kz0MrJE33HltNrQqElm8w++il
   it3HUBfNGUCKN7PN9lB0Fa1zKLlMiF4dqnAtN2+RxvVxbTcM9fYS1X5g7
   Q==;
X-CSE-ConnectionGUID: Ronz7Z/ASIScLgTFzFc+0g==
X-CSE-MsgGUID: A1wgCmnzRCKxJF86kfPwGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="89951849"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="89951849"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:30:49 -0700
X-CSE-ConnectionGUID: W+38pJiGSW2bjTGo7ky3JA==
X-CSE-MsgGUID: Mot2ySwsSwm2ewV01XqJcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="242536257"
Received: from orcnseosdtjek.jf.intel.com (HELO [10.166.28.109]) ([10.166.28.109])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 14:30:49 -0700
From: Jacob Keller <jacob.e.keller@intel.com>
Date: Wed, 13 May 2026 14:30:25 -0700
Subject: [PATCH b4] Prevent interpreting usebranch as a path in
 find_cover_commit
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-jk-dont-interpret-branch-as-filename-v1-1-220e7b8b006d@intel.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNQQ7CMAwEv1L5jKW0hB74CuIQpw51ARc5ASFV/
 XtTOM5oNbtAZhPOcG4WMP5IllkrtIcG4hj0xihDZehc17tTe8TpjsOsBUUL28u4IFnQOGLImOT
 BGp6M7CNR6JN3LkFN1V2S7+/mAuTh+nf5TRPHsvdhXTfzEgFxjAAAAA==
X-Change-ID: 20260513-jk-dont-interpret-branch-as-filename-e4cbba6f400f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.16-dev-0ace0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1528;
 i=jacob.e.keller@intel.com; h=from:subject:message-id;
 bh=pacAnnuPLs1nl++6ZJsG1xBrFxAfG6f6IWSnpWXqg/o=;
 b=owGbwMvMwCWWNS3WLp9f4wXjabUkhiyWt62TmVmappje8b5lc3+i3vWdpvqyN6XCF5RNZf+rZ
 hTk3M7fUcrCIMbFICumyKLgELLyuvGEMK03znIwc1iZQIYwcHEKwEQCBRj+x13aHznBYtX9+RuX
 pW7pKr51beqRTXudFwlEp2t7BVY8vsDIsMXkPs+XK0wt/HK7P55nP7pJ8sHjsr3rFZ2qdVT2Mir
 VMgEA
X-Developer-Key: i=jacob.e.keller@intel.com; a=openpgp;
 fpr=204054A9D73390562AEC431E6A965D3E6F0F28E8

b4 can become very confused if the current branch name happens to also be
the same as a file in the root of the repository. When that happens, the
find_cover_commit() function will execute a git log command that can
accidentally interpret the usebranch value as the path. This results in b4
being unable to identify the cover commit, and assuming the branch is
unmanaged.

Fix this by adding an explicit '--' argument which ensures that git will
disambiguate and never interpret the branch argument as a file name.

This addition is sufficient to resolve my case where I had exported the
patch series using b4 send -o to a directory with the same name as the
branch. It is likely that other git invocation sin the b4 codebase could
benefit from explicit separators, but I did not go digging.

Signed-off-by: Jacob Keller <jacob.e.keller@intel.com>
---
 src/b4/ez.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/ez.py b/src/b4/ez.py
index 3e81138e2dfe..d1e2fba76ea9 100644
--- a/src/b4/ez.py
+++ b/src/b4/ez.py
@@ -902,6 +902,7 @@ def find_cover_commit(usebranch: Optional[str] = None) -> Optional[str]:
         '--no-mailmap',
         f'--committer={limit_committer}',
         usebranch,
+        '--',
     ]
     lines = b4.git_get_command_lines(None, gitargs)
     if not lines:

---
base-commit: d5d981426ead3f490713ef5d2fd1aa3d0f13b005
change-id: 20260513-jk-dont-interpret-branch-as-filename-e4cbba6f400f

Best regards,
--  
Jacob Keller <jacob.e.keller@intel.com>

