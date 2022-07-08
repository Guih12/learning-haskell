{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -Wno-missing-safe-haskell-mode #-}
module Paths_projecto_teste (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/george/projecto-teste/.stack-work/install/x86_64-linux-tinfo6/8161997e0cf4c3ba12b5b842246dc9c72dca74a8dce34bc7d300cd65776e83bd/9.0.2/bin"
libdir     = "/home/george/projecto-teste/.stack-work/install/x86_64-linux-tinfo6/8161997e0cf4c3ba12b5b842246dc9c72dca74a8dce34bc7d300cd65776e83bd/9.0.2/lib/x86_64-linux-ghc-9.0.2/projecto-teste-0.1.0.0-FBEYj78FMBn4gECBA28s70-projecto-teste"
dynlibdir  = "/home/george/projecto-teste/.stack-work/install/x86_64-linux-tinfo6/8161997e0cf4c3ba12b5b842246dc9c72dca74a8dce34bc7d300cd65776e83bd/9.0.2/lib/x86_64-linux-ghc-9.0.2"
datadir    = "/home/george/projecto-teste/.stack-work/install/x86_64-linux-tinfo6/8161997e0cf4c3ba12b5b842246dc9c72dca74a8dce34bc7d300cd65776e83bd/9.0.2/share/x86_64-linux-ghc-9.0.2/projecto-teste-0.1.0.0"
libexecdir = "/home/george/projecto-teste/.stack-work/install/x86_64-linux-tinfo6/8161997e0cf4c3ba12b5b842246dc9c72dca74a8dce34bc7d300cd65776e83bd/9.0.2/libexec/x86_64-linux-ghc-9.0.2/projecto-teste-0.1.0.0"
sysconfdir = "/home/george/projecto-teste/.stack-work/install/x86_64-linux-tinfo6/8161997e0cf4c3ba12b5b842246dc9c72dca74a8dce34bc7d300cd65776e83bd/9.0.2/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "projecto_teste_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "projecto_teste_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "projecto_teste_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "projecto_teste_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "projecto_teste_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "projecto_teste_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
