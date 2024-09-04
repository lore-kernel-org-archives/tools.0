Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FCF3612D
	for <tools@linux.kernel.org>; Wed,  4 Sep 2024 03:40:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725421218; cv=none; b=ZpVNvgEi85KqbxYHPG+hw2A2oxYka2wDkcujeFXZi8+oLsYqBJn0eMGyLI9K/vHSUMdtSGWhwbPQTQbRCom1Gt5U0+lBcBzth2y+2hgkiQF4qEDpCGgi3cktxT5519WQv0cPfjyPokhfyrZTEWrdfcEC/0pRE4I+XdJh/d7CB8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725421218; c=relaxed/simple;
	bh=CqarpocYmi7GkTI4rD9uvMjQ+AW2ZIJ7/q/CeMsOBkU=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=DOdU85AY/Gx704tig+szDXYVsAcWHGYD9XA5GZgdmwkU6BrDcScWZn2mYXdgXjSIR9Vbf5d35HoxLkZyKI0l+KsZgWsKSi6BDWubNOudDXCRHCnfV5Q7q4JoJk7f8ThFgC9uIkXIykn5dBqlADxuZ2lzSXLpBIf67i8jJxoHJv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X8Q3WaT/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X8Q3WaT/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75F85C4CEC2;
	Wed,  4 Sep 2024 03:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725421218;
	bh=CqarpocYmi7GkTI4rD9uvMjQ+AW2ZIJ7/q/CeMsOBkU=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=X8Q3WaT/HX7tmXyXcKuW2nhaTCdviUnFqrYyfctz4qPK7yA10lhUn9vfHaEi8pZLX
	 v9fjUm3KMHmOnDogZNYgoWgYc5jEDK8QooZq7iCar9sBMgenCMygDjW/6DpwY0SElu
	 OXg4hH9wrdxEVllqJdAdc3UjGqwqcPDqmZ5dwnMEFBouhYdz+28T56/pA64ir4828L
	 jFzdDtPAHNoYr/dlFC5tmpaLQPtsso+TFa7O6KTyCPHLcv7sd3CpB/VsZBpBT+i+s0
	 vUolSbhrRIFDF9Cck2b6+v8uxIcdTb6rQDYkNkdl67PMEIXEPnqWhz86wAV9KOpL5b
	 Je8BadrcteRFw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A2663806651;
	Wed,  4 Sep 2024 03:40:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: broonie@kernel.org, tools@linux.kernel.org, tools@kernel.org, 
 konstantin@linuxfoundation.org
Message-ID: <20240904-b219230-ae8f62ed5510@bugzilla.kernel.org>
In-Reply-To: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
References: <9ae3668b-666f-47d9-9d25-be0fc57b6335@sirena.org.uk>
Subject: Re: b4 send falls over sending a series
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Wed,  4 Sep 2024 03:40:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219230

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

