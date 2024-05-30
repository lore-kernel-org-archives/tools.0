Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB5A433CA
	for <tools@linux.kernel.org>; Thu, 30 May 2024 19:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717098627; cv=none; b=dpRBEPUKfHM7fNRxitAPmBqv9Wrlhn+2kf8IoT5ERbk9kVKWsvm34ypWPD4e/YcmaWlICKYaWkP1FAgk3GK4Vb5bvUOVLsB9TAx5CRkQZFjxR7a5EckoI7CuZ4ZyR0d4Jwjywr0NLMFibvjCLdDkpxybRxBDcYlRKsEYGa9+0C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717098627; c=relaxed/simple;
	bh=nKb73oyxOMfZRWLV48ifQEXBxvVmMplSEAUGTXNjq28=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=DdoNXquk6dhV92r6TVUd675Y0sQ4E9j8LMonlCVm77w+s1YDJB8nMMOP/lO2DXf9EmgnlmiElBnDG7sj0KMeOyRsisisUbiR/3aj9KO+XB+K8kckfgIR36x5Gs6+2AYvNVxFhF+OAOBOpvQLRZ6r+rUwtDDynfiilPRSkPj2YLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CmQ4wCXK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CmQ4wCXK"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA427C2BBFC;
	Thu, 30 May 2024 19:50:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717098626;
	bh=nKb73oyxOMfZRWLV48ifQEXBxvVmMplSEAUGTXNjq28=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=CmQ4wCXKLMHXIJzKs2xIckFgrPwVIEWzGvmkAS8tWRn23YBNGNOWdzIPNN/DdDe04
	 SgNCwx3eHbJ0wceWV4vkXX9cn+xJ3NWRgWqHRlO1z4BnAKwKGgKWkEhDDGanboxS1/
	 htfB4wDLfyewiWMlcGYP57suMs0QaAx+TAQ5pwsDcdKS6D0+MKEKs67jAeJP3M5OME
	 sZKENPFu2QsTLFEmT46+TnwcUK5uqMaA86q6RkFvSe20HKhHYOPFk/ZzfaVhWX4WBe
	 sAxRgnF2wFJpf9Tsy3hq9C+XVGuv09e1Zp4HiVybtLxFp1o6Qek+FMaMXznxpE8w/A
	 JcVOniHeBvT8Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 93DBBC3276C;
	Thu, 30 May 2024 19:50:26 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: torvalds@linuxfoundation.org, konstantin@linuxfoundation.org, 
 tools@linux.kernel.org, tools@kernel.org
Message-ID: <20240530-b218874c3-f07ff166f834@bugzilla.kernel.org>
In-Reply-To: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
References: <CAHk-=wjt8e26xgW190=Ws2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com>
Subject: Re: b4 patch selection logic
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 30 May 2024 19:50:26 +0000 (UTC)

Konstantin Ryabitsev writes in commit bf739cd377c7f7c46e01d4058fc3b9993eb44e74:

Auto-noparent standalone patches in the middle of a thread

Automatically recognize situations when a patch or a series is posted in
the middle of a larger thread and automatically apply --no-parent.

Currently works in the following situations:

- a single patch without any versioning info (i.e. just [PATCH])
- a series without versioning info, in which case we will attempt
  to find the cover letter or the first patch in the series

Lightly tested on the use-case specified in the bugzilla entry.
All other cases still need --no-parent.

Link: https://msgid.link/CAHk-%3Dwjt8e26xgW190%3DWs2hrgDsDN6BhCie2do6uQqrcAzF6JA@mail.gmail.com
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218874
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=bf739cd377c7)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

