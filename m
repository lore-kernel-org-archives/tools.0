Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.50091.1590497559610851238
 for <tools@linux.kernel.org>;
 Tue, 26 May 2020 05:52:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=bEVASgX/;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.222.171, mailfrom: konstantin@linuxfoundation.org)
Received: by mail-qk1-f171.google.com with SMTP id c185so6242525qke.7
        for <tools@linux.kernel.org>; Tue, 26 May 2020 05:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=L6yWlItf+OL0DO12xIWyABHsIa6jZOZH6GMlUVmSPl0=;
        b=bEVASgX/+JDJ10dPSWB8ilFNDjReBHV5e6R9nGRfnxH7/42pf1JbrR3fe83ZcLT+hW
         sc4Cp/p12nruNohA1DrmvsIYTdPNprKhs9MEQx8fCPw7RYaiCCQQCzcrhWEd0YBAes+y
         arvc99uKTzxe6lrjF0sZjWIxNMwqhCawe1+V8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=L6yWlItf+OL0DO12xIWyABHsIa6jZOZH6GMlUVmSPl0=;
        b=b654B1geMr40f3w+ydfx7P1Ixf3XhUhDB7mrwBN19zQ/VNI0fRl/T2nTQpNOtcdJwD
         rmzhnaI6CEf033qdSYfJowuK64NKaaSNTDfGaBmVou4cJ14xT83/1K1EQtrJozntLTjE
         heDV7/t+Ggw05XUodOvOeUGx+pJ/vSdSbQMBshYezJWeKO5xyvodgZEdMAC4aMgSUiOr
         eSwzoaxzYoGea0PcDPmZkwuLB10cHzjoWVDzp8YoNBSaGULM/wNeLEBh5/ls48241jaQ
         /SiPfqd8jJoyn41umCoeJsLXUdqZifp2oe8z1k4A3FBDb86DVpIWBNTC/+yVNYDaU0kH
         P16Q==
X-Gm-Message-State: AOAM531tl/lqEuuTc8w0MEr5LIDp5WN70f6SPdkjrw6D0YnpzIcUXZ0c
	5m6mrY8G4/QU/C7ILgVk6EFIXk/Xpcc=
X-Google-Smtp-Source: ABdhPJxdz2OKyi5059n/mRf4RTbQ6j578t2KPlRcpQFqegWsUgYc15+zLvjO/b3vomERu9cJ0lhk4g==
X-Received: by 2002:a37:644d:: with SMTP id y74mr1082263qkb.477.1590497558378;
        Tue, 26 May 2020 05:52:38 -0700 (PDT)
Return-Path: <konstantin@linuxfoundation.org>
Received: from i7.mricon.com (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id a38sm7810071qtb.37.2020.05.26.05.52.36
        for <tools@linux.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 05:52:37 -0700 (PDT)
Received: by i7.mricon.com (sSMTP sendmail emulation); Tue, 26 May 2020 08:52:36 -0400
Date: Tue, 26 May 2020 08:52:36 -0400
From: "Konstantin Ryabitsev" <konstantin@linuxfoundation.org>
To: tools@linux.kernel.org
Subject: Re: [tools] b4 fails to build w/ py 3.6.5
Message-ID: <20200526125236.r6haunzovsst4hjq@chatter.i7.local>
References: <cf0d3873-535b-97e5-f183-8d1abe17610c@suse.cz>
 <2e815dd0-c745-f254-5b00-e69a36cd2d00@suse.cz>
MIME-Version: 1.0
In-Reply-To: <2e815dd0-c745-f254-5b00-e69a36cd2d00@suse.cz>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, May 26, 2020 at 01:46:46PM +0200, Jiri Slaby wrote:
> > while b4 builds fine with python 3.8.3, python 3.6.5 (SLE15-SP2) 
> > fails
> > to build it:
> >> [    3s] + /usr/bin/python3 setup.py build '--executable=/usr/bin/python3 -s'
> >> [    3s] Traceback (most recent call last):
> >> [    3s]   File "setup.py", line 28, in <module>
> >> [    3s]     version=find_version('b4/__init__.py'),
> >> [    3s]   File "setup.py", line 18, in find_version
> >> [    3s]     version_file = read(source)
> >> [    3s]   File "setup.py", line 14, in read
> >> [    3s]     return open(os.path.join(os.path.dirname(__file__), fname)).read()
> >> [    3s]   File "/usr/lib64/python3.6/encodings/ascii.py", line 26, in decode
> >> [    3s]     return codecs.ascii_decode(input, self.errors)[0]
> >> [    3s] UnicodeDecodeError: 'ascii' codec can't decode byte 0xe2 in position 915: ordinal not in range(128)
> >> [    3s] error: Bad exit status from /var/tmp/rpm-tmp.nPNYVp (%build)
> > 
> > It is the tick in PASS_FANCY on line 41 in b4/__init__.py.
> > 
> > I have zero python-fu, but I believe it's because 3.6 tries to load the
> > file using ascii, while 3.8 defaults to utf-8...
> 
> The attached patch fixes it. But as I wrote, I have no idea whether it
> is correct at all.

It's correct, but I think it's better to fix the underlying problem and 
use unicode escape sequences instead (I think I meant to in the first 
place, but forgot).

The following change is in both master and in stable-0.5.y.

Thanks!

-K

diff --git a/b4/__init__.py b/b4/__init__.py
index fcea7df..0d6fd4a 100644
--- a/b4/__init__.py
+++ b/b4/__init__.py
@@ -38,8 +38,8 @@ FILENAME_RE = re.compile(r'^(---|\+\+\+) (\S+)')

 PASS_SIMPLE = '[P]'
 FAIL_SIMPLE = '[F]'
-PASS_FANCY = '[\033[32m✓\033[0m]'
-FAIL_FANCY = '[\033[31m✗\033[0m]'
+PASS_FANCY = '[\033[32m\u2713\033[0m]'
+FAIL_FANCY = '[\033[31m\u2717\034[0m]'

 # You can use bash-style globbing here
 WANTHDRS = [

