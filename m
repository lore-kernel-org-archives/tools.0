Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web08.52547.1606228676810124847
 for <tools@linux.kernel.org>;
 Tue, 24 Nov 2020 06:37:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=nGet+wWn;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: levraiphilippeblain@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id x13so10664681qvk.8
        for <tools@linux.kernel.org>; Tue, 24 Nov 2020 06:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=i7BPlTZ2GGSN7dh9Ro6J/nEuaAojIUZNPt+PWbMdLeA=;
        b=nGet+wWnYmb0DPvvzdUp9KAeKo7WqFlR2XgonVG0PR8f+WZF9bPR8xxxZwJV3OiuzX
         VJo37fM6CH2xXSYrXpiHOe2YOUOSJni5Sjh9pEDtPg7ShVfFOi9fKMyc7cWFysa9h7yc
         zO4buHmcR4RzuAfS8HgyXAmD/incPV+cBBodsKDMfBcN4ETCS9xk0uDm6/Zku3q9O+9Q
         9MD9hQznpXHXsD/cj73g4YdKs8rJBowiNl6WJFpD76sxuRUauPXfWksg/IItIV+ry79G
         p5ZbmFeA/xI2ljeRB6wmmlvmcuvFViOe4ZwZ8AdXDTFpj9Lz1+Wxo+gNed3Eh/Kxwdqr
         XtIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=i7BPlTZ2GGSN7dh9Ro6J/nEuaAojIUZNPt+PWbMdLeA=;
        b=AARithdZHDPl3zM2xnNEGGTQp/dI2dQnzHDJ5KpB/EaGK4UZvxhY2Hm7uibGNGJCPw
         E7g/SKDkVui8CUt7DIvUpz3QRskgy+FKFd0G0hJB+PFhjZVWOEvQX4lWJ94QG+tXaCm6
         7sWxBR7iIdsXhUw3dMN/wYurC1uEaWojPSEN+MkMQpziG9T8VnYMh1QDASvjdId1Z7qX
         IVrp8RG6a8mBC5+djCJ/sRawXV1nERTuSTQ2BQYwTrCw0iWj/G1nGT+yGpKJDmE2ptYy
         ypKWBZJmGUK02Wtfd38uslvXrJrknfgH2bUQIfdrXeCAA2N1ETZIDeMBCSphYcRP+lFF
         zUIA==
X-Gm-Message-State: AOAM531D7dSRea12E5doOR++SzrVjwMLC7mUBnHqYyfmwh+8/P4FA1Le
	Dd5tvz37SRSfN99lCJB+vRI=
X-Google-Smtp-Source: ABdhPJymmVcnvP0R3ob3MdsLLEbQGUDM3W7DB0Z2ovvzjBthlZhdt0hDpDG482VOlfMbQLgGrIUrDw==
X-Received: by 2002:a0c:9e20:: with SMTP id p32mr4925585qve.44.1606228676029;
        Tue, 24 Nov 2020 06:37:56 -0800 (PST)
Return-Path: <levraiphilippeblain@gmail.com>
Received: from [192.168.1.127] ([192.222.216.4])
        by smtp.gmail.com with ESMTPSA id j13sm14440991qtc.81.2020.11.24.06.37.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 06:37:55 -0800 (PST)
From: Philippe Blain <levraiphilippeblain@gmail.com>
Subject: [BUG] b4 can't grap thread with already-percent-encoded slash
To: tools@linux.kernel.org
Cc: mricon@kernel.org
Message-ID: <2ce40a78-4291-c01c-f468-8b7f3be2f379@gmail.com>
Date: Tue, 24 Nov 2020 09:37:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello,

I tried to use b4 to import this thread:
https://lore.kernel.org/git/X7y+cZ3MPqqmGXx%2F@coredump.intra.peff.net/T/#t

using that exact URL:

b4 mbox -o- https://lore.kernel.org/git/X7y+cZ3MPqqmGXx%2F@coredump.intra.peff.net/T/#t

It does not work - I get a 404. I think it's partly 
due to the already-percent-encoded slash (just before the @).
I tried a few things, like manually changing the '%2F' to '/', 
removing the '/T/#t' suffix, adding '-p git' to disambiguate,
but to no avail. I always get either a 404 or 
"That message-id is not known."

Cheers,

Philippe.

