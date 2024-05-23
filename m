Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C86481F5E6
	for <tools@linux.kernel.org>; Thu, 23 May 2024 18:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716488128; cv=none; b=COYtQ2Ul5mujQplumQL4wv2GX+oeEhV3k3D//Bsvro7C/NvFxDhkEobzHHkBLnPoYqa0NxPrhlZEoPy/LwQUvYx6S0n9v+y32FpAPzEAa98zzHvDf/3KDDPZDQ2Fx+EGAjteTL9FuztZezDlbbw44SJ9LwJAiYN98uxfXHIEBmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716488128; c=relaxed/simple;
	bh=ylMvezsIQC3R9ohMUTvrN7nMLIqISBnCet0nDtjAEqM=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=eglAC+fmP1f/SAFLwVU4l05eiVmJVhm768VZlcexv2f1SuK7Krg17Ue7oNqEkhvkV2YHRyFUYbdfbEF7JIQWgIogWf51q9dBGvefXL9ef3cerO5tAfHzMNAvrE3Q8gOSvWl30mjF4K/LDs9ywz8QAD1NEeRwAfTK7Mk4N5kzRYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBdT/Ubj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBdT/Ubj"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 610A7C2BD10;
	Thu, 23 May 2024 18:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716488128;
	bh=ylMvezsIQC3R9ohMUTvrN7nMLIqISBnCet0nDtjAEqM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=jBdT/UbjoHRYsbVkGKoWwZpuvnv3SCQDbtwYgbuU6xqDaUOcLayNeZtLHXLROlI5N
	 dEhVXsCLGXjDgA7HfAzU1DU3myM5FfUJuUXnUh0StiBiftBC807UhkvCPW5x2OlBhf
	 +AttVIJVeRHuwkzD7Acyj02sV0FyqKbsPU9Ld7pH6M9KrWZ0FjxdnGAZBcZh0qLhKd
	 JSQCrD32ix2npgaFhlGj2OHAWA8vkkc6euKn1yYUBs9yzKTAB9zHYXxddQsRzi2Gwg
	 ykS0MUBEqZy7IiKPhswjGRKre8RFuu0dmG2tyHeJaiDAWPuD+HDGEw7UVt/4/+kmoZ
	 sR8sKryUKlw8A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 432E3C54BB3;
	Thu, 23 May 2024 18:15:28 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: tools@linux.kernel.org, konstantin@linuxfoundation.org, 
 broonie@kernel.org
Message-ID: <20240523-b218878c9-8705bba52382@bugzilla.kernel.org>
In-Reply-To: <ZhQ8DoS1GaT0603l@sirena.org.uk>
References: <ZhQ8DoS1GaT0603l@sirena.org.uk>
Subject: Re: Checks for recipients
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: peebz 0.1
Date: Thu, 23 May 2024 18:15:28 +0000 (UTC)

Konstantin Ryabitsev writes in commit 3bb13877d372002e91c463d808d6608de341195e:

ez: don't crash on trailers -u and partial series

When we can only get a partial series from a thread specified via the
cmdline, do not crash when retrieving followup-trailers for a missing
patch.

Reported-by: Mark Brown <broonie@kernel.org>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=218878
Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>

(via https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=3bb13877d372)
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (peebz 0.1)

