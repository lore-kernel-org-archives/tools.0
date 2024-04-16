Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03291386A8
	for <tools@linux.kernel.org>; Tue, 16 Apr 2024 20:09:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713298150; cv=none; b=RI4Szy+0oaMyoF26etTqYv2ngt1d3N9aRi5z8dLtRA/UzAEl7oPPPAeGEFwaJ5nKFT2y7ta76T8NgSi54uFKBjj5Hi6gWyvhWUDtO8OLnZR/8183aqfCp9QLjGz2xH6H0WK0rG+VM3UmRh+zzXF4f1r0gpK8PEzgBYrRkcshspg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713298150; c=relaxed/simple;
	bh=ju8v0SKv5whdWoN5cf6kKgvV2/NwC0X2MbaVQW/+CvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HgEDlfDNC0iWdmyaq17BWiRr+0Bpazh9EGs6r3iGitNc1eeIgy+sosdaCIhlJf2Qi/dtGBZ9dul8mN+04bflxjyKR/8mH01QUGWlNO85p5PZjvjNf0EUdEKaDurJ4vF90GZCDdj2Vb2rvpf5H+hEbq1qc7mPQ6WzzjtPOOWQmAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QgsGR/0w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QgsGR/0w"
Received: by smtp.kernel.org (Postfix)
	id 859B7C3277B; Tue, 16 Apr 2024 20:09:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4398EC113CE;
	Tue, 16 Apr 2024 20:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1713298149;
	bh=ju8v0SKv5whdWoN5cf6kKgvV2/NwC0X2MbaVQW/+CvU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QgsGR/0wlRk83Uy2KDEfLYUeaHPEQt/zu4NzBQTs8iTPjyho53xVe3FTo0geiFVWW
	 SpC776nKycwAztV+U6TpJ1O1MG8lgTKGuvZH794M9HGwiejJ7hKIC/txqBs4yN2AeW
	 pi1nSWOesWfsK4XtpuDV8dXAWIqPdHHgqny5E3CI=
Date: Tue, 16 Apr 2024 16:09:08 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Frank Li <Frank.li@nxp.com>
Cc: tools@kernel.org, robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	conor+dt@kernel.org
Subject: Re: [PATCH 1/2] prep: add --check option to run necessary patch check
Message-ID: <20240416-flashy-jacamar-of-aurora-f093eb@lemur>
References: <20240319045332.2304950-1-Frank.Li@nxp.com>
 <20240412-shaggy-pristine-walrus-319fe3@lemur>
 <Zh2dKbscKTNgC5dW@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Zh2dKbscKTNgC5dW@lizhi-Precision-Tower-5810>

On Mon, Apr 15, 2024 at 05:33:29PM -0400, Frank Li wrote:
> On Fri, Apr 12, 2024 at 05:09:43PM -0400, Konstantin Ryabitsev wrote:
> > On Tue, Mar 19, 2024 at 12:53:31AM -0400, Frank Li wrote:
> > > This just run script/tools/checkpatch.pl
> > 
> > Hello:
> > 
> > Thank you for your contribution. I didn't end up taking it, because I 
> > wanted to make it more generic and less tied to the kernel. However, 
> > there is now very similar functionality in the current master that can 
> > be invoked with "b4 prep --check".
> 
> Can you point me the functionality name?

I'm not quite sure what you mean. You should be able to just run "b4 
prep --check" to use it (with the latest master). E.g.:

  $ b4 prep --check
  Checking patches using:
	/home/user/work/git/linux/scripts/checkpatch.pl -q --terse --no-summary --mailback --showfile
  ---
  ● 0e77d0387477: serial: exar: adding missing CTI and Exar PCI ids
  ● d60ea7cc5b31: serial: exar: add support for reading from Exar EEPROM
  ● c78b0d54faac: serial: exar: add support for config/set single MPIO
  ● 32bd8299e6d3: serial: exar: add optional board_setup function
  ● 656acc105c50: serial: exar: add some CTI helper functions
	● checkpatch.pl: drivers/tty/serial/8250/8250_exar.c:606: WARNING: 'transciever' may be misspelled - perhaps 'transceiver'?
	● checkpatch.pl: drivers/tty/serial/8250/8250_exar.c:612: WARNING: 'transciever' may be misspelled - perhaps 'transceiver'?
	● checkpatch.pl: drivers/tty/serial/8250/8250_exar.c:652: WARNING: 'interupts' may be misspelled - perhaps 'interrupts'?
  ● dfda64f51bcc: serial: exar: add CTI board and port setup functions
	● checkpatch.pl: drivers/tty/serial/8250/8250_exar.c:1147: WARNING: 'interupts' may be misspelled - perhaps 'interrupts'?
  ● 32ea19edf0da: serial: exar: fix: fix crash during shutdown if setup fails
  ---
  Success: 5, Warning: 4, Error: 0

Hope this helps.

-K
