Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9AC1382
	for <tools@linux.kernel.org>; Thu, 16 Mar 2023 05:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678946134; x=1710482134;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=skZsOtRVNGQUHsY+mFhZTFjehiPa3w15ZxF3YGI2ldo=;
  b=nmISk2YC2BAhQuTNPX5xx4nHKhemw7tpdksDHO+mIrspH8s7F6NG0vCg
   /giVrImkH2PZ/cPKGrhBF+7Nrfy6AnLPMONpXI7Kk9wnyHzKExK4BGyJN
   +5XVGn1OPhQlsjhnBV4L+e8h6AnXSwEE3lHDLldusSVUrmpqtbkkb+HD3
   WM68HnZH4mcGIM7uaaCkUyuWKTfeG5bWGsbvsConbfnmLtCzr1s5ug+HT
   XeJvFMW3E0CEIb4yZSQkXvxAgBegRyXTc7rqQs32EalWSHSahDL6aJt6a
   kOqCsXMIxmREPIfWJy1tGmNzOTSxJSePe2bJgiCYIS4ep8kFYaAoVOag7
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="318296050"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="318296050"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 22:55:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629734725"
X-IronPort-AV: E=Sophos;i="5.98,265,1673942400"; 
   d="scan'208";a="629734725"
Received: from aschofie-mobl2.amr.corp.intel.com (HELO localhost) ([10.209.57.6])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2023 22:55:25 -0700
From: alison.schofield@intel.com
To: tools@linux.kernel.org
Cc: Alison Schofield <alison.schofield@intel.com>
Subject: [PATCH b4] Avoid case where message-id and in-reply-to id match
Date: Wed, 15 Mar 2023 22:55:23 -0700
Message-Id: <20230316055523.728335-1-alison.schofield@intel.com>
X-Mailer: git-send-email 2.37.3
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alison Schofield <alison.schofield@intel.com>

A user error while sending a patchset created a lore link that b4 is
not able to handle. The unexpected matching message-id and in-reply-to
id sends b4 into an infinite loop while 'Analyzing follow-up'.

Add a check and break for this case.

b4 am -c https://lore.kernel.org/all/cover.1674070170.git.alison.schofield@intel.com/

Signed-off-by: Alison Schofield <alison.schofield@intel.com>
---

Not so sure this is the first place that b4 can and should detect this.

 b4/__init__.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/b4/__init__.py b/b4/__init__.py
index 94c1693..4ed8ad8 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -333,6 +333,9 @@ class LoreMailbox:
                     pmsg.followup_trailers += trailers
                     break
                 if pmsg.in_reply_to and pmsg.in_reply_to in self.msgid_map:
+                    # Avoid bad message id causing infinite loop
+                    if pmsg == self.msgid_map[pmsg.in_reply_to]:
+                        break
                     lvl += 1
                     for pltr in pmsg.trailers:
                         pltr.lmsg = pmsg

base-commit: 2eb1ab30a6a6f6b140f19ef36b5af7f73f000720
-- 
2.37.3

