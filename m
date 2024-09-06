Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3EC1B85C1
	for <tools@linux.kernel.org>; Fri,  6 Sep 2024 21:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725659717; cv=none; b=AMpjpXbbB410UrodEizB8wxJw8wsLL6h0FTMQAIpiGSKczs+xJt58nYzzT2hDDyrlZCFSFzIqWe974SMyq5m2A9v6NyrZAnwVxHNuBLMMWp3xWP3L8vMhf1zOjjpTSxnSDDReo4+FkSmi42WMBmfhqxS9Sfv9nvlHZ/ZZGrOSTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725659717; c=relaxed/simple;
	bh=8iFW6fDOVEWuwld9gd75vcpBRaAhh9YxdfaWpDVxbUQ=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=TpVQ5LYKmpaw/OGnqK2+af/SD7PqPjNhbqtjUcxVAJxPjLsTBb3joXSFEmpqEh/GrwGoEvnkTELFKm4bb0eXli3yXZOwoT+agfMLyc72F/HSozgjPME9XV3hnbZa6UnUILfjs+yfnqq9EoKztC4zEwmPyWW8TSjI5/FE6RU4KyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NNb8RZ63; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NNb8RZ63"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08D8C4CEC4;
	Fri,  6 Sep 2024 21:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725659717;
	bh=8iFW6fDOVEWuwld9gd75vcpBRaAhh9YxdfaWpDVxbUQ=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=NNb8RZ63WzWlf/EAC3ncyf7jpZ1Mh/VCSUvhYilHlxMJusmYHa80Er2yR2vBI5ZB4
	 /87d746jFBg29Xc2pndU0GcOcMYu/WrwTuzkaLIFqLSsUP6gne4gGSuboUG7cOzOjN
	 PKIo78+fprMzik3A4c8fdSjqrQmdmLJ3qINCP65YSwhHV4otrIsh+US1s4L0qFvZ9k
	 v+GqVnePKi0qL/k5AGAQgwj8CAFMZBL6ZFoPeFU6fpCPkwVBIiWqPfLshrPObU4ni1
	 2ggSVjFJKPEh4PqlcphEgokLVTUyYPULWlomChBz1qxjocsYn+npVw5GZ0yiZ9Y2hW
	 RVvPgybh+HvNA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EEFA93806644;
	Fri,  6 Sep 2024 21:55:18 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: broonie@kernel.org, konstantin@linuxfoundation.org, tools@kernel.org, 
 tools@linux.kernel.org
Message-ID: <20240906-b219230c6-5ea15d7f2d73@bugzilla.kernel.org>
In-Reply-To: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
References: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
Subject: Re: b4 send falls over sending a series
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Fri,  6 Sep 2024 21:55:18 +0000 (UTC)

Konstantin Ryabitsev writes in commit 7be4fe35d52daac57b8c6df7c3cf76218add771c:

ez: use a temporary workdir when preparing sent tags

Instead of operating on the current checkout, use a temporary worktree
and a sparse checkout when preparing the tree to tag as a sent version.

Doesn't fix the bug reported, but will do a better job not leaving the
tree in a messed up stage.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=219230
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=7be4fe35d52d)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

