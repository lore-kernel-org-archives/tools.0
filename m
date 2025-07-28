Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472F725F980
	for <tools@linux.kernel.org>; Mon, 28 Jul 2025 12:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753704142; cv=none; b=i22zU6Zy+ElF+FYVwgygKtoVIlnZwk5Y64z57pKwvUk2kHYjgjhY+fS50Uae8WPRUA7+6yY6VAsdFzKbNkQhzS8VHqgiQGzAOX1hOt/EfNYCrxf/dkPAtr3EdJLEzbvaWuiVY1V7YZ2ELg5LG3d2bcOuiP2j7VBZFQt0GJ2wh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753704142; c=relaxed/simple;
	bh=vZw4PRM/b9IFOPWokUpRHn+fs1hWqyr9RDgASWM4Kd4=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=F+PMB3V5E1POSoZ1z+WbehxgW4A4oTYwYEPGDq0nf/0TcxU+wEaKu5TDM7J23vLa8hffgqH64JGRQxYyVJg/pA30tdXOnKRuO0373+eKEHDngyBqfHU4olm2yPyqyxK/z3euANN1YlPVGw1XX247sB5Smzkem6elnEf0sCblyDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=lIjGX1Y1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="lIjGX1Y1"
Received: by smtp.kernel.org (Postfix)
	id C3F05C4CEF7; Mon, 28 Jul 2025 12:02:21 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C3D66C4CEEF
	for <tools@kernel.org>; Mon, 28 Jul 2025 12:02:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org C3D66C4CEEF
Authentication-Results: smtp.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-615460d9897so936864a12.0
        for <tools@kernel.org>; Mon, 28 Jul 2025 05:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753704138; x=1754308938; darn=kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ukuo+6wY10yimGvG8YPi43jrb+L9CqzdvMz86ZEyIyI=;
        b=lIjGX1Y1gvjoafofhT+dBFUUxbqZ/NlGo1I/7ig4BMpbBniUHrfwYLa4OmUuPxrEhu
         9k6kj+qIUFssAf4wFCyLFma2KOndUb7StNr4f/VILEErTNZLKMAnDurcvZBaPTZeH3UJ
         QRUeCgkHbcyQSm7lShSD5w+MiO1Segz4fWNsXmfTD/Ani1bEoCeULdCULjncfmJG+02Z
         ZlPY+GRkVLSt/0on6pGcG2/QxhzJaB4ggOzkrq3UZJ/v0qMZ4h5Ev2PDTPQDhji74pwT
         i1iXg4udPrq0TL+A9diajmeQaj8YfJX1H7ZJ5cyCCMNMOxxGqSPyeD1+wYkn5RhY5tW+
         bHcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753704138; x=1754308938;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ukuo+6wY10yimGvG8YPi43jrb+L9CqzdvMz86ZEyIyI=;
        b=FXp+dsY2sa4FEy0A9gA4pYyzYxvxonJ4EuEx+eiKJl1bgjLGIQ4ajBudE2+b5glqXm
         aKKkHeAhczLsluaDcdY0alkFiCa6ADLk/f5V0ROSz3sXWZNaNOCZ2NsZiW681w8MsMiE
         ooMGD6b8IdRL2x/4BGs1q9ztRL0dshs3Vx9qEreQnqIM7raEDa2KkwICxRqPa4RrgDUx
         sZGaeh8OmdngvG6Eet8mub6MNfW+kLN248obIWEJ0YIVptTC45BQjE4SGxhVXv8ZjEWs
         HnGwJPToIuVgJd38xlxggCJl9MUR1w1gT17V8V4jKETqWoQPzsQdqgEAjDXQyAGnxS/b
         nvYw==
X-Gm-Message-State: AOJu0Yy9jVKtGceeQx9COOksDG5qyOSvPh0Dd3HtLGjiGMJUTmUmVYBk
	zzu4inJjgziNQLfaMpyGwncV/d+WQlM82ipIR3hSsVLfFkGxYXQL+0pyGIcxUdOz63i8clpBZi/
	ECwf4AruaDORz4hn7vqjnlZBjjH/2CuEf0vPyhbYLa968gGrkrtkLSlE=
X-Gm-Gg: ASbGncvqMA7hiqaysU5yz+bOpoBDNA1Gb0ps5bo+B61oPZdUaPIVAredrAV2jaWC6hA
	2siAesyy3k/+xoQ/lSbvEZ01cag8OTUd6HBMS5kGzsfLoyRdggFTGCSgb6SI7iw0i7Xi1f9OHvk
	ZFcHAIHJuHIWjkrBQgMrRNQ5oN+CpELIK5Oo8LoJ9i4RtpooV4VUmK7CEUFEVa1E8qz4z8Gvf2n
	Idx3E8VpxLrdw18
X-Google-Smtp-Source: AGHT+IFxxoA+2lSviO2pjbQBWzSY+ucwC64k1lGyynykU/lTzgufJYF0Gc35nKDd5I67EEGilszrpj3IOoSeQCcRLkg=
X-Received: by 2002:a05:6402:350d:b0:611:ff68:c55b with SMTP id
 4fb4d7f45d1cf-614f1e00d66mr11069554a12.26.1753704137864; Mon, 28 Jul 2025
 05:02:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Mon, 28 Jul 2025 15:01:51 +0300
X-Gm-Features: Ac12FXyLbOvp5p1OucReDuTXWaVrS3kHFQ3KYQCz7IKzkSJ1pRhzEBH6UXC2uWU
Message-ID: <CAAjaMXYtY62_KeEbshWA4vjhtUzNgTO0wffcZXNy95EqvL+Ovg@mail.gmail.com>
Subject: b4 bug: "Error tagging the revision" in project with git submodules
To: "Kernel.org Tools" <tools@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hello,

When doing `b4 send` on the QEMU project, all works well except
tagging the revision fails, I assume because the temporary git
worktree doesn't have all submodules (perhaps some of them have not
been "update"d to be fetched locally?)

Trimmed `b4 send` output:

> Sent 1 messages
> Unable to fetch from the worktree
> From /tmp/tmpw4rzk8xm
>  * branch                  HEAD       -> FETCH_HEAD
> Could not access submodule 'roms/QemuMacDrivers'
> Could not access submodule 'roms/SLOF'
> Could not access submodule 'roms/edk2'
> Could not access submodule 'roms/ipxe'
> Could not access submodule 'roms/openbios'
> Could not access submodule 'roms/opensbi'
> Could not access submodule 'roms/qboot'
> Could not access submodule 'roms/qemu-palcode'
> Could not access submodule 'roms/seabios'
> Could not access submodule 'roms/seabios-hppa'
> Could not access submodule 'roms/skiboot'
> Could not access submodule 'roms/u-boot'
> Could not access submodule 'roms/u-boot-sam460ex'
> Could not access submodule 'roms/vbootrom'
> Fetching submodule tests/lcitool/libvirt-ci
> Error tagging the revision:
> Recording series message-id in cover letter tracking
> Created new revision v2
> Updating cover letter with templated changelog entries.
> Invoking git-filter-repo to update the cover letter.
> New history written in 0.07 seconds...
> Completely finished after 0.15 seconds.

To be clear, everything else works fine, it's only the tagging that fails.

-- 
Manos Pitsidianakis
Emulation and Virtualization Engineer
