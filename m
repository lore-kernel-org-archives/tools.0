Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B41E33BBB1
	for <tools@linux.kernel.org>; Tue,  7 Apr 2026 16:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775580522; cv=none; b=bBsqyTv6cM9Kl7sA89JLd3euAhRFR0ycZevjECTcPmIJXcjZ7Dj9F7n9cqpU3Lv53Lo4jUnEKBtcecic6IqY9B1W5+pk0yxwEJEyEBIkKzOyLVbxG27pndUyx3JlXPSiGIqABA5ZeH/KwSpHhWwXbk6pScCKnjVlKMpzKODcUVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775580522; c=relaxed/simple;
	bh=W5kNH9aHcd0Z3bhHsiR8Na7+VhPT7vK/YLxzL10JjIY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=et3xYfAVYe+Koe5Kt5Yydf9ggY2k6DRpnEjNh7Hs2ghMXNad3qM2rERBjkikZz8MtXUua6cozDNG5UyWs14hHt+1KoZH9v6eRh4CRUUehcBZKnJ0uP1FNfelN4h5b4WYAm2mtsk668PagCLCYXu7I8PilDz2yHCBzNmQhkGwj4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KFuTaLG0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KFuTaLG0"
Received: by smtp.kernel.org (Postfix)
	id 431D4C4AF0D; Tue,  7 Apr 2026 16:48:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D59CEC19424;
	Tue,  7 Apr 2026 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775580522;
	bh=W5kNH9aHcd0Z3bhHsiR8Na7+VhPT7vK/YLxzL10JjIY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KFuTaLG08lUmTMNh3DlW0vO1RhLsrvsGXxuvB0YGnrXHx5sosldkO+Lac7+fOjlkl
	 noj3+yuvgybtConzEVmEC/6p3fL5VewqnY4PVAWj+kCAc2IoDt1Ep9VY3nPxSC77V6
	 WQ4wJnkFsALsxQ4eD5Nz3O/0BhqU37oBylvWL5IQO19yleMYaVV1n5UNZ5Dz7uERE/
	 KLaj2SpZbTfAhpeLY3tsZI7kfVUxJYoJg+WOd8gO0fKHOPw9Ctfs+xws3K3SGj2lbv
	 O8rqpeYzC+zjjTsF9iaaj1Nsfl9tpCe3/RxuVjL79Mec6MwTAsMErWPQ3MQKEaizcG
	 zrUhJ4lJpzQaA==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 07 Apr 2026 12:48:30 -0400
Subject: [PATCH b4 01/12] Configure ruff format with single quotes
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260407-ruff-check-v1-1-c9568541ff67@kernel.org>
References: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
In-Reply-To: <20260407-ruff-check-v1-0-c9568541ff67@kernel.org>
To: "Kernel.org Tools" <tools@kernel.org>
Cc: Konstantin Ryabitsev <konstantin@linuxfoundation.org>, 
 Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=560; i=tamird@kernel.org;
 h=from:subject:message-id; bh=W5kNH9aHcd0Z3bhHsiR8Na7+VhPT7vK/YLxzL10JjIY=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlXTdOPqZjx64ds0y6sYw95cerMDt5fBdO82iXMlta7v
 8j6cGJax0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKmeUsXIsENLmifi+IO7F8WWMZR++GvWud1orvX7rFkl+Q9m7bV+zcjI8DvxhUf
 AjErvH8o/LI7eTVVgD878WMF283P+sy69CfzLeAE=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

This allows me to format modified code as I go without changing
pervasive style.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 pyproject.toml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/pyproject.toml b/pyproject.toml
index b418bca..a324583 100644
--- a/pyproject.toml
+++ b/pyproject.toml
@@ -81,6 +81,9 @@ files = [
     {filename = "src/b4/man/b4.1"},
 ]
 
+[tool.ruff.format]
+quote-style = "single"
+
 [tool.ruff.lint]
 select = [
     "F",       # https://docs.astral.sh/ruff/rules/#pyflakes-f

-- 
2.53.0

