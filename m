Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F2F19EEA1
	for <tools@linux.kernel.org>; Mon, 23 Sep 2024 16:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727107487; cv=none; b=kFSnR+QWx/U6uSk481fJcJECJgUMaRpnB08h6TLZSu4/eFh0tHwazpQaHMYJyShNw82TEffno8LEw+tRG3jE7ykpq9wTofyYD2EgxViBPu/GVtVa3iD3HwQju5LGP2R13naiKtA/wN8KOSQ3K00sPLvSLzKhl0f/RHkDlzVKZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727107487; c=relaxed/simple;
	bh=C6ik0iWhjMhhkhkuS+v+rBsitvuhuX3ib9o54MxTn7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=DE4f4T7uirfLvS4IhiG3iDS5e78C8xU3PstHnr81eaTQvCnBzx84jrmcEoFYu/iYspTxuxOj9XEFIHMGuYKIRevar1pipUWHI8nFG5L3i+V2Ylwz+9wUtgIcAdITs72u6su/UGyCaQcQyhAyU/Z7fFgzkprnAIw3udqut9/HLdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rGci2cBZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rGci2cBZ"
Received: by smtp.kernel.org (Postfix)
	id 36F33C4CECD; Mon, 23 Sep 2024 16:04:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62117C4CEC4;
	Mon, 23 Sep 2024 16:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727107486;
	bh=C6ik0iWhjMhhkhkuS+v+rBsitvuhuX3ib9o54MxTn7c=;
	h=From:Date:Subject:To:Cc:From;
	b=rGci2cBZ3fUb5gPXmBhEje7nG7mpd6DLzb/yBf1fWsNbPPVLmYncP+bx1j8EE2JIt
	 a3r+qNgpswhij/W3xHIGf3iMaqp0hxOyARemYCTNga0+Pwu1VGgPbVB9gxSxcxH556
	 X9rmaUOfB7eUireTaHxcL9mMB+FoTVOqDlTRiUfwz/zjk1q3PX52PzJHdZkYaMxevA
	 PtgysNSLDTH3B2o2mK2mbUG+BIjKAw2Wyu5n8RgosmUS3BQgPdPJBFxoM7SsRvbxiG
	 Do/6fX4C5Uo1I4TiklIiBbeufrECK//0P2NOU2L+UnRI4w+YHysyt28wOA7oJsHqEX
	 tT6s6xkDCqs7g==
From: "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
Date: Mon, 23 Sep 2024 18:04:31 +0200
Subject: [PATCH b4 v2] send: generate patches with --no-mailmap
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240923-send-mailmap-v2-1-e2c62f1de79b@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI6R8WYC/22NQQ6DIBREr2L+ujSAGLGr3qNxAfWjP1Uw0Jg2h
 ruXsO7yzWTenJAwEia4NSdEPChR8AXkpYHnYvyMjKbCILlUXEvOEvqJbYbWzewMnbamHbTquIM
 y2SM6+lTdA6yCsWQLpXeI3/pwiNr8lx2CCda7tuv1YFFZcX9h9LheQ5xhzDn/AHnnV/2tAAAA
X-Change-ID: 20240820-send-mailmap-ef8ba398450f
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 "Matthieu Baerts (NGI0)" <matttbe@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2229; i=matttbe@kernel.org;
 h=from:subject:message-id; bh=C6ik0iWhjMhhkhkuS+v+rBsitvuhuX3ib9o54MxTn7c=;
 b=owEBbQKS/ZANAwAIAfa3gk9CaaBzAcsmYgBm8ZGdFPjamkN/BZYS1NTH7subyDpUI8hcv1GH/
 dBa4JhxdLyJAjMEAAEIAB0WIQToy4X3aHcFem4n93r2t4JPQmmgcwUCZvGRnQAKCRD2t4JPQmmg
 czuCD/9ijjBtN4TrTxM+Kawl035wEu3f6qluaX+SuVlMwslpKgxSwb+VXPX4LamdacDPbn2pMTz
 Cih1nqKKxbwlKflZ2GNOEYEviAWerdkVv0ZXAmEhP8xOVebcG+fbiKxSoQPw+GWkhV+NUjDoPbd
 gtsFUvU3hZkdjIGE/IA5xYrSMmfdTDlMoBzmk79PIzK0tu3kG632QiTRt75/srnXjnYnRhwnyPF
 g0MO9CEkhUSYF+fA0ctJ0NnoiTpFuPlTSpFPyVSDDoa8v9FXCLdGA2BEuJQQdmuqvzG/VzlEpup
 JquhWYJiy1REFacoJGajU1P+0aMlIa6uP3b9V1bVfYlrMvMlj6Qj5w7YxIwFzS1qAzAmxCAKkqb
 zRjbAKeUzYOWhyRXSwW5YpXU/g/D4+bQZtvZHnLBkkKc1rLYc4yen8MD1YmHLhFWnmk6twzuMcP
 tuL1AYKTEIbHco+X1Oq/H5OG7KbC15+m251yU6IyDks7rY2uB0QTMqf36hGwHH/t4kzjmFiWR9R
 E3+npMp6i2GIYLRZgwAZ9gQZ7OwEo36716ueag4bHUlxb8CmcH4qfDweji/hKHL8//63JCNQMKV
 eZzZJPLMF19SnEK3kL3pGreDFaeoL9BxSfzTsdCVCsF+p1tPvHJ/JTzYr1w1j7TEGbUf9DqJK4E
 kkOQHzmjodiaDXA==
X-Developer-Key: i=matttbe@kernel.org; a=openpgp;
 fpr=E8CB85F76877057A6E27F77AF6B7824F4269A073

b4 uses 'git show' to generate patches. By default, this command will
use the mailmap file to convert author and committer names and email
addresses if there is a match.

That's good to display the last identity when looking at old commits in
the history, but it doesn't sound like a good idea when sending patches.
'git format-patch' doesn't use the mailmap file, it currently doesn't
even support it, and it is not planned to support it apparently [1].
Note that 'git send-email' might support a new '--mailmap' option, but
it looks like this option will not be enabled by default [2].

In my case, I had to send some patches, including one from someone else
who has to use the email address from his company, but has an entry in
the mailmap file to his @kernel.org email address. When I sent his
patch, b4 seamlessly converted his email address, and caused checkpatch
to complain, because the From and the SoB entries were different.

Here, we ensure the conversion is not done, to avoid any surprise once
the emails are sent.

Link: https://lore.kernel.org/all/20240813-jk-support-mailmap-git-format-patch-v1-1-1aea690ea5dd@gmail.com/ [1]
Link: https://lore.kernel.org/all/20240827-jk-send-email-mailmap-support-v3-0-bec5ba9be391@gmail.com/ [2]
Signed-off-by: Matthieu Baerts (NGI0) <matttbe@kernel.org>
---
Changes in v2:
- Rebased and resolved conflicts.
- Link to v1: https://patch.msgid.link/20240820-send-mailmap-v1-1-7f35789be4b1@kernel.org
---
 src/b4/__init__.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/src/b4/__init__.py b/src/b4/__init__.py
index 811bbcaf028d78224242433eac9fdbeb03a306b3..a650d114bcc1d0fb534fda3735101458062a8386 100644
--- a/src/b4/__init__.py
+++ b/src/b4/__init__.py
@@ -3463,6 +3463,7 @@ def git_range_to_patches(gitdir: Optional[str], start: str, end: str,
                 '--binary',
                 '--patch-with-stat',
                 '--encoding=utf-8',
+                '--no-mailmap',
                 commit,
             ],
             decode=False,

---
base-commit: dedf88cb947bab87c418b49d975df11f83621692
change-id: 20240820-send-mailmap-ef8ba398450f

Best regards,
-- 
Matthieu Baerts (NGI0) <matttbe@kernel.org>

