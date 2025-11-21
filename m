Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0E2D0C62
	for <tools@linux.kernel.org>; Fri, 21 Nov 2025 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763750214; cv=none; b=mjaeb9nLWONdsrjgMshO0RrE5jG0QRjFDysoc27CoXhxd7qfF7YUWT03MInlhLrk5LDeh76BKlPp0rgFSaNrEpIFb3kev/m2R3rx87hNKAboybJyf9hGz+KcKAj1oXPBjbVKYLUj3MECJDCI5tYBRA+KaQV+yVAgVJmYGDQ+swY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763750214; c=relaxed/simple;
	bh=oNbLwE9sVTrodWuhOpuGEIgsKtObbpX1j1kPyLHszRc=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QRKgTxws5KB2Ht+5lpejiT76JsGKTdmp+joAXndCa2wvtjlOyyLIEr/WXPMD58CwzNHm/WnK/pbPkOS7UUs+WayU7Wd65Ys3E/YCUVbDZH5JRVuLSnBDv/WiArP5rB5/DWU1efsymVvsxyD9c7UYEU0ESzV7ofYR/4GN6w4Gf4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=odjRbQgi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="odjRbQgi"
Received: by smtp.kernel.org (Postfix)
	id 5A78BC116D0; Fri, 21 Nov 2025 18:36:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113F2C4CEF1;
	Fri, 21 Nov 2025 18:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1763750214;
	bh=oNbLwE9sVTrodWuhOpuGEIgsKtObbpX1j1kPyLHszRc=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=odjRbQgigazXAl6/Lqw8sy6sRO9GmtktpaLsZWe7gg1cKfSILW2wsqql3ImmouUlK
	 /bRQ/8zykddkwty1MV7uG/xOzNyjMvGU10CZbtllH4wVl9UDNrs915wDggWqGcdVsC
	 DE9b/dpVn+iiNuuZ/XgKaNDmo4abKYBfExHovUoc=
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: "Kernel.org Tools" <tools@kernel.org>, 
 Marcos Paulo de Souza <mpdesouza@suse.com>
In-Reply-To: <20251121-check-codespell-v2-1-336192f1997c@suse.com>
References: <20251121-check-codespell-v2-1-336192f1997c@suse.com>
Subject: Re: [PATCH b4 v2] prep --check: Add support to spellcheck if
 codespell is installed
Message-Id: <176375021394.2405231.9139073314926592803.b4-ty@linuxfoundation.org>
Date: Fri, 21 Nov 2025 13:36:53 -0500
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773


On Fri, 21 Nov 2025 15:29:45 -0300, Marcos Paulo de Souza wrote:
> This commit adds --codespell to checkpatch.pl is the codespell package is
> installed.
> 
> If b4 is installed with pipx you need to use --system-site-packages when
> calling install, otherwise it won't see the packages installed by your
> package manager.
> 
> [...]

Applied, thanks!

[1/1] prep --check: Add support to spellcheck if codespell is installed
      commit: 0f736aa3d4bf71a9139ce9c46054b5f1b38ac45e

Best regards,
-- 
Konstantin Ryabitsev <konstantin@linuxfoundation.org>

