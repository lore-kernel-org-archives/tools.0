Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 404EF1C1AD9
	for <tools@linux.kernel.org>; Thu, 10 Oct 2024 13:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728567629; cv=none; b=Qke0YJmmFeMwkQnUH9Agjilc2D2MkHN3NZmyluLwms94awzp/E+7sHtyszX9adVVhmBwsJRsIqLBDUzpJxWOFJJETj2qmxfkHdgPmJ5BKaCyRiDCWU2vgF9guVVvfDKmmzPJrYOWEpyxUqGPoRiCDL0AF25+I2RyAbv6Nv4x8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728567629; c=relaxed/simple;
	bh=9n3RyMA4Xu9whhOhxl7rtpSeO9lrLCmXxv/SjJmq5No=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtUyUM0EG4mHXxesKipJHKzXk6QWpzGutGGR5ou6IlLkQaVVWv2IC/L+3eTYh5o3SzsWOb3UgMj3dYFEGx6E5JZS88peY4MsX238ETv3cd7Dej2xbK71oYBR4My8HsL7DNPEu3nLXW/UrGhUAgqrS7m2qmqckcfJSFbueDaz474=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=VRP0bu3K; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VRP0bu3K"
Received: by smtp.kernel.org (Postfix)
	id C9934C4CECC; Thu, 10 Oct 2024 13:40:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83E08C4CEC5;
	Thu, 10 Oct 2024 13:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1728567627;
	bh=9n3RyMA4Xu9whhOhxl7rtpSeO9lrLCmXxv/SjJmq5No=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VRP0bu3KesLO/lvmELcul6hmdbw2/6dDuJgOIVitbUSko14LASpqw/nDWOumk6EYr
	 cf9F/5nrG5SJqwM3T2qHe4bc3SygDgbKClIUokLIS8A2yHLbRDU/s/SK4TX9AAi0Ft
	 qvfS5Rika/qtLb0flzQ76jqG6jVYOOU5ea1cUQqc=
Date: Thu, 10 Oct 2024 09:40:26 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Christian Heusel <christian@heusel.eu>
Cc: tools@kernel.org
Subject: Re: b4 crashes due to type error when signing with gpg key
Message-ID: <20241010-refined-important-mole-a56fc5@lemur>
References: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>
Precedence: bulk
X-Mailing-List: tools@linux.kernel.org
List-Id: <tools.linux.kernel.org>
List-Subscribe: <mailto:tools+subscribe@linux.kernel.org>
List-Unsubscribe: <mailto:tools+unsubscribe@linux.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9ebef39e-ec9d-403c-a0f2-9a3176d71c1a@heusel.eu>

On Thu, Oct 10, 2024 at 02:44:11PM GMT, Christian Heusel wrote:
>     $ b4 send -o /tmp/presend
>     Converted the branch to 1 messages
>     Will write out messages into /tmp/presend
>     Traceback (most recent call last):
>       File "/sbin/b4", line 8, in <module>
>         sys.exit(cmd())
>                  ^^^^^
>       File "/usr/lib/python3.12/site-packages/b4/command.py", line 417, in cmd
>         cmdargs.func(cmdargs)
>       File "/usr/lib/python3.12/site-packages/b4/command.py", line 93, in cmd_send
>         b4.ez.cmd_send(cmdargs)
>       File "/usr/lib/python3.12/site-packages/b4/ez.py", line 2111, in cmd_send
>         sent = b4.send_mail(smtp, send_msgs, fromaddr=fromaddr, patatt_sign=sign,
>                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>       File "/usr/lib/python3.12/site-packages/b4/__init__.py", line 3978, in send_mail
>         bdata = patatt.rfc2822_sign(bdata)
>                 ^^^^^^^^^^^^^^^^^^^^^^^^^^
>       File "/usr/lib/python3.12/site-packages/patatt/__init__.py", line 1002, in rfc2822_sign
>         pm.sign(algo, keydata, identity=config.get('identity'), selector=config.get('selector'))
>       File "/usr/lib/python3.12/site-packages/patatt/__init__.py", line 580, in sign
>         idata.append(b'fpr=%s' % pkinfo)
>                      ~~~~~~~~~~^~~~~~~~
>     TypeError: %b requires a bytes-like object, or an object that implements __bytes__, not 'str'

Can you give me the output of the following:

    git config --get user.signingkey

and:

    gpg --with-colons --fingerprint "$(git config --get user.signingkey)"

-K

bugspray tag me
