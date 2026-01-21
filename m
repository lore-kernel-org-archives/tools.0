Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A833314AC
	for <tools@linux.kernel.org>; Wed, 21 Jan 2026 03:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768965793; cv=none; b=FuHUxOHf+7J4Yxe9iK6xYgJFsgK/AHOjg+rQCLDc7fxLud3mAseoyunRkZ8uWibnwKJ9bnRErrz/bHYJWFX5FTdFORYnyQWabIIQbeJ3UrExlp6kkpqDF2PeqtRqiFYZleOA+1/uQ9AiqqmKJQ7xW4hDRt5Gr97uTfm6p9Vg5SY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768965793; c=relaxed/simple;
	bh=aSTSU23jMu/yYFT2TQbxkwOeXsQbKhvv8hpysfuJ4FU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGVlN7sPm/qnovv4g5WGBg/9/BB0j9kFIFJOY6u+hjp84lEGmchJuZf3TxEvYbImrIiQ+HNwNFuS39oNy/QrFbEO36qchfGFeK3zI0mEB8Iq7vJ4cb9oC+4ZGTOI+1t2XVD2CbPm7/Gj4lr2icGZ1rABoMXvjShCF9SUP9YR/3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GIv8fT/Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GIv8fT/Q"
Received: by smtp.kernel.org (Postfix)
	id 831DAC19423; Wed, 21 Jan 2026 03:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 407E0C16AAE;
	Wed, 21 Jan 2026 03:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768965793;
	bh=aSTSU23jMu/yYFT2TQbxkwOeXsQbKhvv8hpysfuJ4FU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GIv8fT/Q6P1ifzY7L5P8i0S95t2snxZK/osly/FYhCpaUgeTQ2j7ElQydpFxC7n8w
	 TmYiRgwQvbdwy7helLQ2ATZMwbEPN5zF/VWA4d3wCnpSn0gjNu2Xlp3yDLgkNFyYNz
	 1ldrzAm2c+DOmx6Bo/DIqHREufs06V6VcknMuC7w=
Date: Tue, 20 Jan 2026 22:23:12 -0500
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Lee Jones <lee@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?QW5kcsOp?= Draszik <andre.draszik@linaro.org>, 
	tools@kernel.org, users@kernel.org, Peter Griffin <peter.griffin@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Will McVicker <willmcvicker@google.com>, 
	Juan Yescas <jyescas@google.com>, Douglas Anderson <dianders@chromium.org>, 
	kernel-team@android.com, Kaustabh Chakraborty <kauschluss@disroot.org>, 
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v2 0/3] Samsung mfd/rtc driver alarm IRQ simplification
Message-ID: <20260120-incredible-ladybug-of-psychology-605faf@lemur>
References: <20251120-s5m-alarm-v2-0-cc15f0e32161@linaro.org>
 <176892415694.2292562.7457528145774108517.b4-ty@kernel.org>
 <20260120155241.GG1354723@google.com>
 <e9bde783-42f3-4f28-9a5e-aa65f36db9ca@sirena.org.uk>
 <20260120172405.GI1354723@google.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260120172405.GI1354723@google.com>

On Tue, Jan 20, 2026 at 05:24:05PM +0000, Lee Jones wrote:
> > If you fetch a series but don't delete it from the database then (with
> > b4 ty -d) then b4 will remember it and if any commits in what gets
> > applied match it'll generate a mail for b4 ty -a.  Usually that's when
> > some commits didn't get changed.
> 
> The last attempt to apply this failed with conflicts.
> 
> I wonder why b4 stored that as a success?

It doesn't actually know -- it just stores the retrieved series and then
checks if it can find any of them in the tree in a commit with your
authorship. Sometimes it breaks.

My plan is to put in interactive mode where you can do a quick sanity check --
currently it's all of nothing with "b4 ty -a".

-K
