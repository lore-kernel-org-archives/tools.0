Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50503033E8
	for <tools@linux.kernel.org>; Fri, 13 Feb 2026 22:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020301; cv=none; b=AYb2HqLccjFibbeX119ZCWcNQ+ou/TixAm1rfIVJ5uDdB85PjtvJHAZzrFlfzcH3J2K0i3IiVaYfQWlkSzrWL2wSlyOCB9pwco+HmjV4fqCgPUHISShIwYuECXZp3L58mHljBQgX6i+WJrYdnfsFwe4V2MkJdHxrvEEJGU5O/Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020301; c=relaxed/simple;
	bh=+gSQ9Pe2sLC9l0n9Zho9eAtHEwIr+E7Nuw0AG6LyVas=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=JEj1db3RZcLFcjxTs2HTYqL9fN4Th93YHxB+rUaPF0Gw0458MEuCormxNNc7S0FFEX6XlVSRjjONAnAQ1iIKqmrXLCqZPo6wzwaA5JFH2sZXJk9aggpGxUBylq2AP5COO9wfgyqcjsFfqrdKTHktri/91URJtn1U/AhHM6q3RnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=wean7zX6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="wean7zX6"
Received: by smtp.kernel.org (Postfix)
	id 98FCBC19424; Fri, 13 Feb 2026 22:05:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5176AC16AAE;
	Fri, 13 Feb 2026 22:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1771020301;
	bh=+gSQ9Pe2sLC9l0n9Zho9eAtHEwIr+E7Nuw0AG6LyVas=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=wean7zX6AMGRjo6Rdf0B/kgAhNmBQoxMHV9SzoJ0LBIGjdUHZ+742yO053C81FD4C
	 6V0H/f3CyduMSNisWr8h2fJpi84O5LD48EtAQzQya+n4hybBAbaGM86A1975v9fLay
	 K8lopcUrvhqdVWn4UP0QgC/zzJZjKIbdfK4WTaQ0=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: tools@kernel.org, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
In-Reply-To: <20260213163821.4098648-1-u.kleine-koenig@baylibre.com>
References: <20260213163821.4098648-1-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH patatt] Make install-hook work on submodules
Message-Id: <177102030120.2520541.333660067690529596.b4-ty@linuxfoundation.org>
Date: Fri, 13 Feb 2026 17:05:01 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15-dev-4e7d2


On Fri, 13 Feb 2026 17:38:21 +0100, Uwe Kleine-König wrote:
> The gitdir for submodules isn't '.git' below the toplevel directory. So
> use
> 
> 	git rev-parse --git-dir
> 
> to find the directory that holds the hook script.
> 
> [...]

Applied, thanks!

[1/1] Make install-hook work on submodules
      commit: d8ea60b65cad9b92003eef92153457736652e2bd

Best regards,
-- 
KR


