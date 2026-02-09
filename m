Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE6324B2B
	for <tools@linux.kernel.org>; Mon,  9 Feb 2026 20:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770668269; cv=none; b=mVIFLLXsuiPv3agLEt1KpEqVGtinUkEL9pwUFS5PMj9PnbI6LlYg8gX12YHir4OUIYv/wDrs7JqEa/ck/tuO+31VuyXAgtWdarw7KvF6zLKsT01SdSdvG/e3unRw7u+cy4lbOCw/GrIPYiXT3N7P/AMpa66fwVUt9mn1XfR7r4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770668269; c=relaxed/simple;
	bh=hSb5o8yCnQuTgiw9MawLn57HBHwN07rUTo/5DLvKsB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=maFiWM/bZnFvYliTji5VH1yGiB+aG673s4vyJDbcM0oZU7lhivMpgesEPniRJyrB/iHTs80KZyoBScjUU8g1hhDW/2YTQZLNnZQ+RGYzY0PojaK4tSJE6IuWQTfPam6drni0XCpkwwWaqhNY28kaGSHnFcrvK3Ox8GVuNsQfBsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cffitgeh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cffitgeh"
Received: by smtp.kernel.org (Postfix)
	id 88136C19424; Mon,  9 Feb 2026 20:17:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49509C16AAE;
	Mon,  9 Feb 2026 20:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770668268;
	bh=hSb5o8yCnQuTgiw9MawLn57HBHwN07rUTo/5DLvKsB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cffitgehgyNUhBYeMSafiPMiB11WIqyLUHEuVbQWtNsHAWs6Lx19q3A7wr8/CvniE
	 o9q4BqrxYRyYjxX52tQ4JyXHUjcKLpj8EbeGdAwHlqi4byqcN6g6LH3MrBWfz0iDh1
	 a3jr0ojeOu6Cv5tCRkqdElc0af1LcTMKdz7ILcEiCSLuz8C+x2jrrZK0zWBP2fT4T5
	 BV79NCzwAN9hqLfxyHQ8IOiDPHe0wcZLyYTkwUINwvEANHC+4XRzGMYzKb1hXw0CTL
	 rENQRd8NfUPB7hGguM0KfonOihNCEqBM0a7VdjpTvG1Ty6pJscAzN94YT/AMcun2Yg
	 0u7dWk5ejSrVg==
Date: Mon, 9 Feb 2026 15:17:47 -0500
From: Konstantin Ryabitsev <mricon@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Kernel.org Tools" <tools@kernel.org>, 
	Andi Shyti <andi.shyti@kernel.org>
Subject: Re: korgalore bug: Feed state not found for lch@ list
Message-ID: <20260209-hungry-phenomenal-unicorn-1ad4be@lemur>
References: <695ccea6-bb19-4f6d-99cf-1d898b53b1cc@kernel.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <695ccea6-bb19-4f6d-99cf-1d898b53b1cc@kernel.org>

On Sat, Feb 07, 2026 at 09:52:05PM +0100, Krzysztof Kozlowski wrote:
>   File
> "/home/krzk/.local/share/pipx/venvs/korgalore/lib/python3.13/site-packages/korgalore/pi_feed.py",
> line 227, in find_epochs
>     raise PublicInboxError(f"No existing epochs found in {epochs_dir}.")
> korgalore.PublicInboxError: No existing epochs found in
> /home/krzk/.local/share/korgalore/lch/git.

I *think* this is from the code that wrongly assumes this is a migration from
the previous data structure during korgalore-0.1 days and then falls on its
face.

I added a fix in master and stable-0.5.y -- would you be able to clone that
and try?

    git clone https://git.kernel.org/pub/scm/utils/korgalore/korgalore.git
    cd korgalore
    git checkout stable-0.5.y (or use master)
    pipx install --force .

-K
