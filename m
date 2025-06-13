Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D67D9444
	for <tools@linux.kernel.org>; Fri, 13 Jun 2025 15:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749827742; cv=none; b=fJ65H4OmzlWdGITbCuzg5lfV0wuGWWDCfNS6sIZDETjuX7z3JG2+/R5yWYp26ropjo+uD6aUSa7odpw57EBKElGt3YAP5MqcFMQ7kBl8hTGWvZ6VnEezk4DJEhFOiV+cERBwI9Jf4XUcTrnTKFhhT/LbWyDkpL8rdMCCoGPrL/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749827742; c=relaxed/simple;
	bh=aCNQmh/eCB5gyhOiYB8K8aRWYv1JohNkaHyXmtEhAd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0e4c1Wd3uSvvDGX6z8dwd35uBiXUw9Ylws3LyZ9VomH6ccArIARSb1uR4P816l6t5uzq7p2f7RbgUeqoVVX3DzFHZppyA1dn1XgWaQRSDr9gpapmVD/2Tz4Cg9Rv+hTyvtW7ndYavTcheFS1I+GOg3WZIV/BY7JfORIRw/CP7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xCT2n2S4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xCT2n2S4"
Received: by smtp.kernel.org (Postfix)
	id 7A335C4CEF0; Fri, 13 Jun 2025 15:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46299C4CEE3;
	Fri, 13 Jun 2025 15:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1749827741;
	bh=aCNQmh/eCB5gyhOiYB8K8aRWYv1JohNkaHyXmtEhAd4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xCT2n2S4C3lTsEigE7UfUPuDvnQ21y5ODzsTAHoymgpqgsFsowMw27WYd9k6OiOGa
	 iCxpF+uQkged57YYO36G8Th7m2QFjDRQvKy+3TbIT2gGF5M4XV2UndS4LClAxMrGag
	 ezx0M/tlrInCiutDUE/sVThw+ScWsgTPrD76UBz4=
Date: Fri, 13 Jun 2025 11:15:40 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: tools@kernel.org
Subject: Re: [PATCH wotmate 1/4] export-keyring: Skip graph generation if the
 trust path didn't change
Message-ID: <20250613-inventive-literate-owl-46daa4@lemur>
References: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef678713de0a9aec1c1f07d92faa29e1f5b5e4e5.1749804735.git.u.kleine-koenig@baylibre.com>

On Fri, Jun 13, 2025 at 10:53:16AM +0200, Uwe Kleine-König wrote:
> It can happen that a key changes without affecting the trust paths. That
> might be a new (or expired) subkey or a new signature that doesn't
> matter for the trust paths. So always compare the trust txt file with
> the new paths to prevent noop changes in the svg representation.

Thank you for this series. I wanted to ask about adding a signed-off-by, but
realized that the repository didn't have a DCO file. I've now added it -- can
you please send a v2 with your Signed-off-by?

Thanks,
-K
