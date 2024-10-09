Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4612C40849
	for <tools@linux.kernel.org>; Wed,  9 Oct 2024 19:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728502760; cv=none; b=kjNMRvoO65iqWLq3TBonXKj5WHqj8Er02y5J+QEoDvzeLpm/6GwlLzs4k9Zf/1Bwvrwe7kteHAYgge6CYEV8lhw1/edCbevSqGXOUlaTezMlXbXzpp444IjwlOqyfsUamaFO+1OfY3x8nXt//lMMRBk/bJShVJ04aHaK/8z9EE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728502760; c=relaxed/simple;
	bh=WACLHGHcDT/W647XxTUfFMN5nWHdLr63qkOv/SdLp1E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=rO9116AmIj1B3Jqq7Xy4EUQtbc5JS/k1uC7/T8TYBZAG7Eojxxl3ZiLtMxf+VMNOnMpb2xXDaB8xVzf5+6KrtFb4gAGp37dWI6cXzvDoCu9l1urbFccbEzq+sZc/2WvLWkn3kl8eNU+7xZa4w/vUdby03mkHq0tPSi6CUvV6+V4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b=MyhTRK1C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collins.com header.i=@collins.com header.b="MyhTRK1C"
Received: by smtp.kernel.org (Postfix)
	id 2FCDAC4CECC; Wed,  9 Oct 2024 19:39:20 +0000 (UTC)
Received: from mx0b-00105401.pphosted.com (mx0b-00105401.pphosted.com [67.231.152.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AAC5CC4CEC3
	for <tools@kernel.org>; Wed,  9 Oct 2024 19:39:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org AAC5CC4CEC3
Authentication-Results: smtp.kernel.org; dmarc=pass (p=reject dis=none) header.from=collins.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=collins.com
Received: from pps.filterd (m0346902.ppops.net [127.0.0.1])
	by mx0a-00105401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 499JCW9d016900;
	Wed, 9 Oct 2024 19:39:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=collins.com; h=cc :
 content-transfer-encoding : content-type : date : from : message-id :
 mime-version : subject : to; s=POD051818;
 bh=y8EWAfCPLBuzsQZv2q+aT++vUisaA+cKLMft8sJ4X0U=;
 b=MyhTRK1C+GIq1lEnB5bswN1+wNNc3dctwwrwCYr48hp1mbYecQYzgjG0PrJ+cn6ZJ9mC
 rSGBPR5s5XlplPcDShxmOzaR7/6zdoYlR37cfrSvlBbo/Xji8D15cXmFyWei2NSUpq1k
 A2rvao+IK5e3YxT+cxEx+f+B2rb7GCiZlmSBERh5zKCwaEG9gMD2CoE5fjxj1tIf7T11
 vr+TGbbx0aK0clLHEBJTpEDiyYsNzDrrF9feSAkR91UxwsU0tZvLKOv4flXbaDDg3Dfs
 P7zCLRZCQyuLCshaJnP2P41JsDJoE/dAYC66TJ5QgHHJx6K3zb/XUODJiFR1NAoOy16n eg== 
Received: from xusxph009rp050.rtx.com (xusxph009rp050.rtx.com [128.13.125.147])
	by mx0a-00105401.pphosted.com (PPS) with ESMTPS id 425yspg88x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 09 Oct 2024 19:39:09 +0000
Received: from xusxph009rp020.corp.ray.com ([128.13.125.224])
	by xusxph009rp050.rtx.com (8.18.1.2/8.18.1.2) with ESMTPS id 499Jd8VY016119
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Oct 2024 19:39:08 GMT
Received: from ciulimr02.rockwellcollins.com (snat-utc-mailhub.rockwellcollins.com [10.172.224.19])
	by xusxph009rp020.corp.ray.com (8.18.1.2/8.18.1.2) with ESMTPS id 499Jd8bt026768
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 9 Oct 2024 19:39:08 GMT
X-Received: from localhost (unknown [10.148.204.208])
	by ciulimr02.rockwellcollins.com (Postfix) with ESMTP id 39D24100277C;
	Wed,  9 Oct 2024 14:39:08 -0500 (CDT)
From: Brandon Maier <brandon.maier@collins.com>
Date: Wed, 09 Oct 2024 19:38:58 +0000
Subject: [PATCH b4] b4: support optional shell completion
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-pypi-completion-v1-1-94f50a157c56@collins.com>
X-B4-Tracking: v=1; b=H4sIANHbBmcC/x2MQQqAIBAAvyJ7TtCtQ/WV6FC61kKlaEQR/j3pO
 DAzLySKTAl68UKkixP7o4CuBJh1OhaSbAsDKmy0Up0MT2Bp/B42Oosr29ohITqnbAelCpEc3/9
 xgLmBMecPwxvHF2UAAAA=
X-Change-ID: 20241009-pypi-completion-83f2e22ff0d9
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        Brandon Maier <brandon.maier@collins.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_18,2024-10-09_02,2024-09-30_01
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_18,2024-10-09_02,2024-09-30_01
X-MHapp-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 malwarescore=0
 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090122
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 suspectscore=0 mlxscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2409260000
 definitions=main-2410090122
X-Proofpoint-GUID: -kQ8xLXE4I3rw2VAXq8uBwN7_O3pkVQn
X-Proofpoint-ORIG-GUID: -kQ8xLXE4I3rw2VAXq8uBwN7_O3pkVQn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-09_18,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_default_notspam policy=outbound_default score=0 clxscore=1011
 lowpriorityscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=999 spamscore=0 mlxscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2409260000 definitions=main-2410090122

Shell completion support was added in commit 333189c by using a shell
script to generate the completion files with python-shtab. This script
can be run by distribution packagers to include shell completion.
However this does not support the use case of installing b4 with pip
from PyPi[1], because PyPi doesn't support distributing shell completion
scripts.

Many tools support this by having a command line flag that can generate
the completion scripts. In the original version of the shell completion
by Emil Velikov this was supported with `b4 --print-completion bash`,
but it was decided against to avoid bringing in more dependencies[2].

This restores Emil's work, but using a Python optional-dependency. This
way the base install for b4 is unchanged, but PyPi users that want shell
completion can install it with `pip install b4[completion]`.

[1] https://github.com/mricon/b4/issues/47
[2] https://lore.kernel.org/tools/20240305-obedient-centipede-of-finesse-a35a86@lemur/

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
---
 README.rst                      | 18 ++++++++++++++++++
 misc/requirements-completion.in |  1 +
 pyproject.toml                  |  3 +++
 src/b4/command.py               |  7 +++++++
 4 files changed, 29 insertions(+)

diff --git a/README.rst b/README.rst
index 20577e447b002b3837866bc8a007db95ef7ab301..b1db598dfa12115c226452ff5e086ac3c4662c37 100644
--- a/README.rst
+++ b/README.rst
@@ -20,6 +20,24 @@ Or to install the latest master (warning, maybe broken!)::
 
     python3 -m pip install git+https://git.kernel.org/pub/scm/utils/b4/b4.git@master
 
+Shell completion
+----------------
+b4 makes use of the python-shtab module to provide static shell completion
+files. Currently python-shtab supports bash, zsh and tcsh, where others may be
+added in the future.
+
+To install b4 with pip and shell completion use::
+
+    python3 -m pip install b4[completion]
+
+Shell completion is provided by the command ``b4 --print-completion
+{bash,zsh,tcsh}``. To enable shell completion run::
+
+    eval $(b4 --print-completion bash)
+
+To make it permanent on new shells, add that command to your ``$HOME/.bashrc``
+or ``$HOME/.zshrc``.
+
 Upgrading
 ---------
 If you previously installed from pypi::
diff --git a/misc/requirements-completion.in b/misc/requirements-completion.in
new file mode 100644
index 0000000000000000000000000000000000000000..a5993fffe28875b84c0480c83a850b496cdd10c1
--- /dev/null
+++ b/misc/requirements-completion.in
@@ -0,0 +1 @@
+shtab>=1.7
diff --git a/pyproject.toml b/pyproject.toml
index 31bfe3033650b2b251fcdcbab0456f4a67e914df..4914b0aa13b1ceab4a622c03c94587aac2441017 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -27,6 +27,9 @@ dynamic = ["dependencies", "optional-dependencies"]
 [tool.setuptools.dynamic]
 dependencies = { file = ["requirements.in"] }
 
+[tool.setuptools.dynamic.optional-dependencies]
+completion = { file = ["misc/requirements-completion.in"] }
+
 [tool.setuptools.packages.find]
 where = ['src']
 exclude = ['tests*']
diff --git a/src/b4/command.py b/src/b4/command.py
index 5d90b4f52b4f3bd84f8660c26fc005af98309c26..2bdd785d90004bc0be9c839fe50938dc9cbbe207 100644
--- a/src/b4/command.py
+++ b/src/b4/command.py
@@ -162,6 +162,13 @@ def setup_parser() -> argparse.ArgumentParser:
                         value to the empty string. Using NAME and omitting
                         =VALUE will set the value to "true".''')
 
+    try:
+        import shtab
+
+        shtab.add_argument_to(parser, ["--print-completion"])
+    except ImportError:
+        pass
+
     subparsers = parser.add_subparsers(help='sub-command help', dest='subcmd')
 
     # b4 mbox

---
base-commit: 2a6338e451a0c1e81f214f48c820c1e52d76b2f1
change-id: 20241009-pypi-completion-83f2e22ff0d9

Best regards,
-- 
Brandon Maier <brandon.maier@collins.com>

