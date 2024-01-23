Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3108A53808
	for <tools@linux.kernel.org>; Tue, 23 Jan 2024 23:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706050815; cv=none; b=lKwaunju/dCGZbC52Bet05jK3Mo75AuUwKSwvj4YsNVzZSRSWEi1ORpK/Wi8BPCOUcmMMf3PgKOIQfaHq281rcQVCtuh1nsUsoJif/oyE+H+2ta/UU58IIV2wz7/bO+viWKzKUGHRLn0ZTr4uyobhZ36n6q2nef3w/uiHTjge30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706050815; c=relaxed/simple;
	bh=YyJiYFSgrzIajfe9xUIdYD96iKwsQ9+GHcNodSuQNpY=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GY65zJu8nsHhFCF4UJy2NhkApzK/UHSRbr6ABL0cQ2K0pCpIemYP0Dg+cxp+i8YFqDCWHyxtqjGKNNww4zA9gOO+BZlPPv5wgMNXVWsG34pX2fOz+/t/tHjqX0tlUuwRcEx7Wtkom194kqh0/fK5ncFfy2VtzDawh3Zgpc2AxrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=h0T7t6V5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="h0T7t6V5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DECEC433F1;
	Tue, 23 Jan 2024 23:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706050814;
	bh=YyJiYFSgrzIajfe9xUIdYD96iKwsQ9+GHcNodSuQNpY=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=h0T7t6V56Kyoz150Y9NzGHNQ4a0QH6zh7xGma6hEWuLUlmTwAtIOPujh+mdoLNX4N
	 puShuWDNJni7vO22ppc3p1u34V6MhJ1zQPKdHOHAVlCLxrX+LXFcK1kvRo1Ptjz5N7
	 OrjyrXknqRJnwFq55RXpn70jBOeU9Hnteg61B3VI=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org, Jani Nikula <jani.nikula@intel.com>
In-Reply-To: <20240118202544.2019009-1-jani.nikula@intel.com>
References: <20240118202544.2019009-1-jani.nikula@intel.com>
Subject: Re: [PATCH 0/2] b4: Add support for setting config on the
 command-line
Message-Id: <170605081458.52578.10520164198389154753.b4-ty@linuxfoundation.org>
Date: Tue, 23 Jan 2024 18:00:14 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-c7690


On Thu, 18 Jan 2024 22:25:42 +0200, Jani Nikula wrote:
> Add -c/--config name=value option to set and override config options on
> the command-line.
> 
> Only very lightly tested.
> 
> 
> BR,
> Jani.
> 
> [...]

Applied, thanks!

[1/2] init: separate config setup from access
      commit: ccdafeadb856095132b28929519d835802509e21
[2/2] b4: add --config option to set config options on the command-line
      commit: a8b915060228e594b76989211adf1a8e96fe58de

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

