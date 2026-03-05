Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25697263F4A
	for <tools@linux.kernel.org>; Thu,  5 Mar 2026 14:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772722542; cv=none; b=YQA/vvyVyxdalJVnXZMAFzE/0J+7nxeeFVSZJQ5K+Uh1NmOdcJhHIAL7SmIbmswzeVc2fjfK2qRXuH8t1ntcCFOtzs/7BVvEtNdMDFeoVfAvoJ9mdMII2+H1is6auH8cI7ZzoH+vqy5JUUX+tDLovTx42kz/CM0MYXKu9MDwnxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772722542; c=relaxed/simple;
	bh=iH1cX0huVbbz4yl46heFL3nxzvCIamftBAP70xdj0dc=;
	h=Message-ID:Date:MIME-Version:From:To:Subject:Content-Type; b=ePFkAXy3JMdnXUQAid1J/1EcFXb8oQDwJcQ171fITzHlNPVA5yN9jxhjC2+KTdYzHSrqvJIAePIBjppZs+VRG4oU1O9chBn9wVgT0ZLILMOIFLoKAuZwzPXoT5YN/F5OENAwioLG7ydz2OLmQLqim6j1ODyryamfnOoYRY105Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XNjTG5pm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XNjTG5pm"
Received: by smtp.kernel.org (Postfix)
	id 1CB06C2BC87; Thu,  5 Mar 2026 14:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC765C116C6
	for <tools@kernel.org>; Thu,  5 Mar 2026 14:55:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772722542;
	bh=iH1cX0huVbbz4yl46heFL3nxzvCIamftBAP70xdj0dc=;
	h=Date:From:To:Subject:From;
	b=XNjTG5pmRXFqh+8ONtfDk2lqPGSWu33TH8PxCRi3yj256HRbNWMtx012bml4IaFk6
	 yNQVBQYnp5Es2ubdFOhv0Jh60Hjb9HynLOotnMoc7fv2YDoE9YGNXq2TKukYyRq9jl
	 OjVAMhw6aMljlYqI2pSoxq+Ii8jHYHaYC/UsBVYgpwCm3XE5mbkuVKSOAAWn3s4bfz
	 OzA2w4GWwpCScjEhihUAJ3gkDAmtfnScYug+jc7vyW5g1kz8qHVBSKqKdcG5lcB01i
	 GfqXGwQ+OuJwNKfd1hucfAd4tRr+fOkkkXTF7CtH6JFR8HKQQjxd0O9YAM2HBvfhyJ
	 ZQcsVnUnxGnbg==
Message-ID: <2991adad-9271-4e83-82ec-1e23c37cdb2c@kernel.org>
Date: Thu, 5 Mar 2026 15:55:39 +0100
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>
Content-Language: en-US
To: tools@kernel.org
Subject: CLI kgl --yank default target
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

as discussed on IRC, please add a way to kgl --yank use a default target if
there are multiple ones set up.
Apparently the gnome applet uses the first target defined, so CLI could do
the same?

Thanks,
Vlastimil
