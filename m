Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B191AD3E8
	for <tools@linux.kernel.org>; Thu,  5 Sep 2024 20:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725567318; cv=none; b=b2QbjuFaEmbkxUhQLG9V9fnPTUC2h5JRYDBryFcn4mHyQVuF73Eii7BhowcQ0Om3DG22YxNBSoavcyu8P3ta4j2bnZu6062YedFUJ8jB/0v+aZ6lBUT8HkHfVCF64SZB2fBnvR/3TMrRx24MqaGBRv/WyzyKme9bPPCXHhmyq/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725567318; c=relaxed/simple;
	bh=lCoNi+cHJxYc4cOMKxmltA3+rLtzoYwfDbMqzZUQxR4=;
	h=MIME-Version:Content-Type:From:To:Message-ID:In-Reply-To:
	 References:Subject:Date; b=OR0BZ2pHJKgFcaLr3bLisPrwzbwWtav2Ne5svBREF01YzRyPKcCJ8UZC2XYc99mtgdwN3PEwXCmLp026F0OPpsAYWfBq/tvMfRq+DM1O21kLWsLHHyRmyqfoE9rhrB3QJeHDJwOJtYIfvkezw/UbfpZF4EXl1TV6S5s85XeSRcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oPkjU3DI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oPkjU3DI"
Received: by smtp.kernel.org (Postfix)
	id 60F09C4CEC3; Thu,  5 Sep 2024 20:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49C97C4AF09;
	Thu,  5 Sep 2024 20:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725567318;
	bh=lCoNi+cHJxYc4cOMKxmltA3+rLtzoYwfDbMqzZUQxR4=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=oPkjU3DIZrVSPSh0r9Pmf5IPVh8sq/BPoGqWdFGuN8rWPanoqkyWyBeEavptCRWHL
	 4NvTILHsr4dht4izLgrehIcv92WGGEFoGld1XTLlZzW71N/x/xSiw15rvETU+iqe7M
	 MrbD6Wau/lM5Mgx6IT+1SxLMZyZ1mst9FkJHaATYOBiLlLxSlW8RTO1e5mYun+mcTQ
	 m+JsX4qWt+/s8Z3da+iE9T3DaBtT9k9pD5UKzt97P3bAJ7cPo6TslDGtvJoLdYxKQs
	 vmOr8vym84gFgMuyxfLwDWobhANbb06T7qecMSFIW8FWlJTn5lvVVNhgdAIVAlymbi
	 wNdtVH3Q0k7Bg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 390323806651;
	Thu,  5 Sep 2024 20:15:20 +0000 (UTC)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
From: "Kernel.org Bugbot" <bugbot@kernel.org>
To: konstantin@linuxfoundation.org, tools@kernel.org, 
 tools@linux.kernel.org, broonie@kernel.org
Message-ID: <20240905-b219242-ce2fd2aa9d41@bugzilla.kernel.org>
In-Reply-To: <fc6eba60-6cde-4e8c-a075-61d564c33e26@sirena.org.uk>
References: <fc6eba60-6cde-4e8c-a075-61d564c33e26@sirena.org.uk>
Subject: Re: b4 prep --check for signoffs
X-Bugzilla-Product: Tools
X-Bugzilla-Component: Infra
X-Mailer: bugspray 0.1-dev
Date: Thu,  5 Sep 2024 20:15:20 +0000 (UTC)

Hello:

This conversation is now tracked by Kernel.org Bugzilla:
https://bugzilla.kernel.org/show_bug.cgi?id=219242

There is no need to do anything else, just keep talking.
-- 
Deet-doot-dot, I am a bot.
Kernel.org Bugzilla (bugspray 0.1-dev)

