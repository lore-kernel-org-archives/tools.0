Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D3D0172BCE
	for <tools@linux.kernel.org>; Tue, 28 May 2024 19:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716923875; cv=none; b=lYoIYDyHCPnEgp+Nkg9ff1cULlk49ZIIiATrgN4YRSCNlDhOP4j7XHOB0ArJ68JkgajEh+52/kp2GrTW+HZSd+cWLWg/2FzYQWw6nKa22grMnAJIOIg3RXDuq0tNoJqGDI+oQjR177tytjgT1rDezXGJ/uxVJTFRTmcNfoqkDcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716923875; c=relaxed/simple;
	bh=hWsB+TZIXWdiwAM1FYDH9OvWvXYFpYVCt1lV6UXtcJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pSjrgyvjcSRslDUHbJxDxrZlo3uivV3z4eCjWO6AkN3p1XBI2y7NNAndoEs2y/GKevPK6vnsf16CiHE9dRzviInzjFSU4LQTurDirjDokrkcnLtmq44frmQxbU+bzT17aIVGcZicGnkajhTuyKs3YlkiVLXQYNn9k68fawuYgCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=RzfQRRDX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RzfQRRDX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C573C3277B;
	Tue, 28 May 2024 19:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1716923874;
	bh=hWsB+TZIXWdiwAM1FYDH9OvWvXYFpYVCt1lV6UXtcJw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RzfQRRDX76AhtaCuuhAAR22tN62crddrpqwg9WEtHJn85XhwNAMenFHccRpTNo2qL
	 cpQSeO1aKLqwykMV98CBf3PNfby26rIuGvQWkVkVUki0OW+krW4AwHuvQWDPfWZrK6
	 Annw4f/XPtPuC2TB+h3K34gifHjs3EKstnsVvf40=
Date: Tue, 28 May 2024 15:17:51 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Mark Brown <broonie@kernel.org>
Cc: tools <tools@linux.kernel.org>
Subject: Re: Single patch ranges no longer understood
Message-ID: <20240528-solemn-vole-of-contentment-15da36@lemur>
References: <177fedb6-241a-420c-ab5f-8b7ae4d7acd9@sirena.org.uk>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <177fedb6-241a-420c-ab5f-8b7ae4d7acd9@sirena.org.uk>

On Tue, May 28, 2024 at 01:23:14PM GMT, Mark Brown wrote:
> Hi,
> 
> If I run
> 
>   $ b4 am -S -t -g -3 -o /tmp/x -P 1 4ce8c4f16f1cf3aa4e5f36c0694dd3c5ccf3cd1c.1716870419.git.alina_yu@richtek.com
> 
> I get:
> 
>   Analyzing 6 messages in the thread
>   Unknown range value specified: 1
>   Checking attestation on all messages, may take a moment...
>   ---
>     ---
>     ✓ Signed: DKIM/richtek.com
>   ---
>   Total patches: 0 (cherrypicked: 1)
> 
> which is not good both since the failure to find any patches isn't
> clearly reported and since I'd expect to get patch 1 fetched.  If I
> instead specify the pick as "1-1" it fetches patch 1 as expected.  I'm
> fairly sure just specifying a patch number used to work.

Thanks for the report. It's probably the side-effect of this:
https://git.kernel.org/pub/scm/utils/b4/b4.git/commit/?id=2c6f29168557b64650ad53494a7be282efcfd74b

I'll either roll back or attempt to fix.

bugbot assign to me

-K
