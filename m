Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D5B331A564
	for <tools@linux.kernel.org>; Tue, 13 Jan 2026 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768317525; cv=none; b=WRPQdcgezJYpVpvDjqkiihorOJB2AkuoTo3An6xW5L/CHZyyH+ETmgSIkAtrYBCpbaP2KRWaa/6TXqj9/9SEw780GqLVAsMxFRjq6o/832+aJB2ZnEkAB+sJNSjy+9aeNf1NvWMrIlaQUakayTllyUQA4LlfxFHVTWBtH1hLBNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768317525; c=relaxed/simple;
	bh=foIDC4zAcSAdsTp2b+cv8DgMFKjbL8s0V18vaTP8OI0=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=MlYpxRzKPxV4/ZhqgEeoBVSJX0KobNV4DqDGI0F2K1s40DdO6mU6Pmd2mFU4nlP12m0Len5T5Tsb26zrfqBnqoebQYYdyIvolw7kmJaD8IvmQ+hnvi/CaG4Z62BTCiD10Fb4quk5TppMEPp4vfaTHXDCH/UbnCMyWqPdK2+q9Js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=brgC92LP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="brgC92LP"
Received: by smtp.kernel.org (Postfix)
	id 539FBC19421; Tue, 13 Jan 2026 15:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D5FEC116C6;
	Tue, 13 Jan 2026 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768317525;
	bh=foIDC4zAcSAdsTp2b+cv8DgMFKjbL8s0V18vaTP8OI0=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=brgC92LPqD7m20fZYk7hGALOdV5ktfmZQGwwS34ep6slrnHVFBvWT+VnIdeWuVXgB
	 hQaD03cAKL/vECc+R+LWZdKN+TZze3iNIVlAtpQ+9R+1sKEShWkUvZkhYpC8GRSZSE
	 A49SFaoPzhhVJGqXIOLkUZsppRY5cpOC6+vWo22cifgFRYoytnfM3rkC5lNWt9frtf
	 xFo2n3JPT+FHyVtZgOqvaaqj70Nl6ced7MrLgsPPreOJW9PXT4vv65IvpS1ViId3XP
	 4GIZYK1mdp+y2bEmEoNmlhP5ctPGx9E7eQe1WjAr9TqwftrNepmTiWcMXi29jI3SWI
	 66twtXKJpvsMw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BAF983808200;
	Tue, 13 Jan 2026 15:15:19 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: Bugspray Bot <bugbot@kernel.org>
To: tools@kernel.org, bugs@lists.linux.dev, broonie@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20260113-b220972-b2dc53e64b19@bugzilla.kernel.org>
In-Reply-To: <0890b0f9-24a5-4bd0-b682-fddfc3fb3cd4@sirena.org.uk>
References: <0890b0f9-24a5-4bd0-b682-fddfc3fb3cd4@sirena.org.uk>
Subject: Re: b4 dig struggling with some commits
X-Bugzilla-Product: Linux
X-Bugzilla-Component: Kernel
X-Mailer: bugspray 0.1-dev
Date: Tue, 13 Jan 2026 15:15:19 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=220972

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

