Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051F41D540
	for <tools@linux.kernel.org>; Sat, 30 Mar 2024 14:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711808691; cv=none; b=XBNmyI3AJhfln4VK7cK0l3A80pDuzfkSq2idBT1NguU80dKh+FtS2VBHh/d2KtFV5G7Yyx/vPbQUXrz6w7vBip1pFcg6OEMFXNQqeFqxjCjtMc+/ZKUTCnPhB71SLUWE65LWo0POMgBtjuR1ZZ4MDo466toD4PHDhtRguKkR27g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711808691; c=relaxed/simple;
	bh=92mFnNHUHwhxamaf/BAAhiyDDVKltme1i3/n4H6D+Vg=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bUPVyIVeHLk5eW7Xyyj32nY4NkQM6qFMJOFB+XkAEvam7ANbjbkBPlgf09Y8sCNtizpfZSrpg0d66FMtZQaERzaNDnsFfqN7rpPPI894KR6D47cb68Cs9WU94ByxOcR9Xyx0VfjYEGhA+koYfac8ozzzsz4duaaeOAFFqzVZJkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix)
	id B2163C43390; Sat, 30 Mar 2024 14:24:50 +0000 (UTC)
Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.kernel.org (Postfix) with ESMTP id 3F7A4C433F1
	for <tools@kernel.org>; Sat, 30 Mar 2024 14:24:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.kernel.org 3F7A4C433F1
Authentication-Results: smtp.kernel.org; dmarc=none (p=none dis=none) header.from=altlinux.org
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from imap.altlinux.org (imap.altlinux.org [194.107.17.38])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 4CB7C72C8FB
	for <tools@kernel.org>; Sat, 30 Mar 2024 17:24:40 +0300 (MSK)
Received: from altlinux.org (sole.flsd.net [185.75.180.6])
	by imap.altlinux.org (Postfix) with ESMTPSA id 388B236D071E
	for <tools@kernel.org>; Sat, 30 Mar 2024 17:24:40 +0300 (MSK)
Date: Sat, 30 Mar 2024 17:24:39 +0300
From: Vitaly Chikunov <vt@altlinux.org>
To: tools@kernel.org
Subject: grokmirror from kernel.googlesource.com
Message-ID: <20240330142439.7qjcbbhnqxf2ta3h@altlinux.org>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=koi8-r
Content-Disposition: inline

Hi,

Is it OK to mirror git.kernel.org from it's mirror
kernel.googlesource.com using grokmirror?

I am not sure the manifest is updated after it's already mirrored there
and it doesn't get racy.

(Recently we getting 502 Bad Gateway from git fetch from git.kernel.org
directly.)

Thanks,

